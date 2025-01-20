@interface IMFallbackTranscoder_AudioMessage
- (id)_tmpOutputFileURL;
- (void)_failWithOSStatusErrorCode:(int)a3 description:(id)a4 completion:(id)a5;
- (void)transcodeOpusFile:(id)a3 completionBlock:(id)a4;
@end

@implementation IMFallbackTranscoder_AudioMessage

- (void)transcodeOpusFile:(id)a3 completionBlock:(id)a4
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  if (a3)
  {
    ExtAudioFileRef outExtAudioFile = 0;
    uint64_t v7 = ExtAudioFileOpenURL((CFURLRef)a3, &outExtAudioFile);
    uint64_t v14 = v7;
    if (outExtAudioFile) {
      BOOL v15 = v7 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
      v21 = objc_msgSend__tmpOutputFileURL(self, v8, v9, v10, v11, v12, v13);
      uint64_t v93 = 0;
      v28 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v22, v23, v24, v25, v26, v27);
      uint64_t PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v21, v29, v30, v31, v32, v33, v34);
      objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v28, v36, PathComponent, 1, 0, (uint64_t)&v93, v37);
      if (v93)
      {
        if (IMOSLoggingEnabled())
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v97 = v21;
            __int16 v98 = 2112;
            uint64_t v99 = v93;
            _os_log_impl(&dword_22B280000, v38, OS_LOG_TYPE_INFO, "IMFallbackTranscoder_AudioMessage: error creating directory for path %@ with error %@", buf, 0x16u);
          }
        }
        (*((void (**)(id, void, void, uint64_t, void, uint64_t))a4 + 2))(a4, 0, 0, v93, 0, 1);
      }
      else
      {
        ExtAudioFileRef v92 = 0;
        memset(&inStreamDesc.mFormatID, 0, 32);
        inStreamDesc.mSampleRate = 8000.0;
        inStreamDesc.mFormatID = 1935764850;
        inStreamDesc.mChannelsPerFrame = 1;
        uint64_t v39 = ExtAudioFileCreateWithURL((CFURLRef)v21, 0x616D7266u, &inStreamDesc, 0, 1u, &v92);
        if (!v92 || v39)
        {
          ExtAudioFileDispose(outExtAudioFile);
          if (v92) {
            ExtAudioFileDispose(v92);
          }
          uint64_t v49 = objc_msgSend_stringWithFormat_(NSString, v44, @"Creating new file at path: %@", v45, v46, v47, v48, v21);
          objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v50, v39, v49, (uint64_t)a4, v51, v52);
        }
        else
        {
          long long inPropertyData = xmmword_22B2A0BA0;
          long long v89 = unk_22B2A0BB0;
          uint64_t v90 = 32;
          uint64_t v40 = ExtAudioFileSetProperty(v92, 0x63666D74u, 0x28u, &inPropertyData);
          if (v40)
          {
            ExtAudioFileDispose(outExtAudioFile);
            ExtAudioFileDispose(v92);
            objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v41, v40, @"ExtAudioFileSetProperty / kExtAudioFileProperty_ClientDataFormat for AMR", (uint64_t)a4, v42, v43);
          }
          else
          {
            uint64_t v53 = ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, &inPropertyData);
            if (v53)
            {
              ExtAudioFileDispose(outExtAudioFile);
              ExtAudioFileDispose(v92);
              objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v54, v53, @"ExtAudioFileSetProperty / kExtAudioFileProperty_ClientDataFormat for Opus", (uint64_t)a4, v55, v56);
            }
            else
            {
              AudioConverterRef outPropertyData = 0;
              int v86 = 6700;
              UInt32 ioPropertyDataSize = 8;
              uint64_t Property = ExtAudioFileGetProperty(v92, 0x61636E76u, &ioPropertyDataSize, &outPropertyData);
              if (Property)
              {
                ExtAudioFileDispose(outExtAudioFile);
                ExtAudioFileDispose(v92);
                objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v58, Property, @"ExtAudioFileGetProperty / kExtAudioFileProperty_AudioConverter for AMR", (uint64_t)a4, v59, v60);
              }
              else
              {
                uint64_t v61 = AudioConverterSetProperty(outPropertyData, 0x62726174u, 4u, &v86);
                if (v61)
                {
                  ExtAudioFileDispose(outExtAudioFile);
                  ExtAudioFileDispose(v92);
                  objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v62, v61, @"AudioConverterSetProperty / kAudioConverterEncodeBitRate for outConverter", (uint64_t)a4, v63, v64);
                }
                else
                {
                  uint64_t v84 = 0;
                  uint64_t v65 = ExtAudioFileSetProperty(v92, 0x61636366u, 8u, &v84);
                  if (v65)
                  {
                    ExtAudioFileDispose(outExtAudioFile);
                    ExtAudioFileDispose(v92);
                    objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v66, v65, @"ExtAudioFileSetProperty / kExtAudioFileProperty_ConverterConfig for AMR", (uint64_t)a4, v67, v68);
                  }
                  else
                  {
                    bzero(buf, 0x8000uLL);
                    while (1)
                    {
                      *(&ioData.mNumberBuffers + 1) = 0;
                      *(void *)&ioData.mBuffers[0].mNumberChannels = 0x800000000001;
                      ioData.mBuffers[0].mData = buf;
                      UInt32 ioNumberFrames = 0x8000u / DWORD2(v89);
                      ioData.mNumberBuffers = 1;
                      uint64_t v69 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
                      if (v69)
                      {
                        ExtAudioFileDispose(outExtAudioFile);
                        ExtAudioFileDispose(v92);
                        objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v74, v69, @"ExtAudioFileRead", (uint64_t)a4, v75, v76);
                        return;
                      }
                      if (!ioNumberFrames) {
                        break;
                      }
                      uint64_t v70 = ExtAudioFileWrite(v92, ioNumberFrames, &ioData);
                      if (v70)
                      {
                        ExtAudioFileDispose(outExtAudioFile);
                        ExtAudioFileDispose(v92);
                        objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v71, v70, @"ExtAudioFileWrite", (uint64_t)a4, v72, v73);
                        return;
                      }
                    }
                    ExtAudioFileDispose(outExtAudioFile);
                    ExtAudioFileDispose(v92);
                    v95 = v21;
                    uint64_t v81 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v77, (uint64_t)&v95, 1, v78, v79, v80);
                    (*((void (**)(id, uint64_t, void, void, uint64_t, uint64_t))a4 + 2))(a4, v81, 0, 0, 1, 1);
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      uint64_t v16 = objc_msgSend_stringWithFormat_(NSString, v8, @"Opening Opus file at path %@", v10, v11, v12, v13, a3);
      objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v17, v14, v16, (uint64_t)a4, v18, v19);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22B280000, v20, OS_LOG_TYPE_INFO, "IMFallbackTranscoder_AudioMessage: nil filePath", buf, 2u);
      }
    }
    (*((void (**)(id, void, void, void, void, uint64_t))a4 + 2))(a4, 0, 0, 0, 0, 1);
  }
}

- (id)_tmpOutputFileURL
{
  v32[3] = *MEMORY[0x263EF8340];
  v2 = (void *)IMSafeTemporaryDirectory();
  uint64_t v9 = objc_msgSend_path(v2, v3, v4, v5, v6, v7, v8);
  v32[1] = objc_msgSend_stringGUID(NSString, v10, v11, v12, v13, v14, v15, v9);
  v32[2] = @"Audio Message.amr";
  uint64_t v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v16, (uint64_t)v32, 3, v17, v18, v19);
  uint64_t v26 = objc_msgSend_pathWithComponents_(NSString, v21, v20, v22, v23, v24, v25);
  return (id)objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v27, v26, 0, v28, v29, v30);
}

- (void)_failWithOSStatusErrorCode:(int)a3 description:(id)a4 completion:(id)a5
{
  uint64_t v6 = (__CFString *)a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    IMLogBacktrace();
    uint64_t v6 = @"NO DESCRIPTION!";
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = v6;
      __int16 v15 = 1024;
      int v16 = a3;
      _os_log_impl(&dword_22B280000, v11, OS_LOG_TYPE_INFO, "IMFallbackTranscoder_AudioMessage: %@ failed with error code %d", (uint8_t *)&v13, 0x12u);
    }
  }
  if (a5)
  {
    uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v8, *MEMORY[0x263F08410], a3, 0, v9, v10);
    (*((void (**)(id, void, void, uint64_t, void, uint64_t))a5 + 2))(a5, 0, 0, v12, 0, 1);
  }
}

@end