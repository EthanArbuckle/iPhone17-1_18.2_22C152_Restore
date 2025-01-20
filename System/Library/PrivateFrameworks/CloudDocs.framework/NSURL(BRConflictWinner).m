@interface NSURL(BRConflictWinner)
- (id)br_addFakeConflictLoserFromItemAtURL:()BRConflictWinner lastEditorDeviceName:error:;
- (id)br_lastEditorName;
- (uint64_t)br_addFakeConflictLoserFromItemAtURL:()BRConflictWinner lastEditorDeviceName:lastEditorUserName:error:;
- (uint64_t)br_lastEditorDeviceName;
- (uint64_t)br_lastEditorNameComponents;
@end

@implementation NSURL(BRConflictWinner)

- (uint64_t)br_lastEditorDeviceName
{
  return objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", @"BRURLUbiquitousItemLastEditorDeviceNameKey", 0, 0);
}

- (id)br_lastEditorName
{
  v1 = objc_msgSend(a1, "br_lastEditorNameComponents");
  v2 = objc_msgSend(v1, "br_formattedName");

  return v2;
}

- (uint64_t)br_lastEditorNameComponents
{
  return objc_msgSend(a1, "_br_getAttributeValue:withSecondaryConnection:withError:", *MEMORY[0x1E4F1C7B8], 0, 0);
}

- (uint64_t)br_addFakeConflictLoserFromItemAtURL:()BRConflictWinner lastEditorDeviceName:lastEditorUserName:error:
{
  return objc_msgSend(a1, "br_addFakeConflictLoserFromItemAtURL:lastEditorDeviceName:error:", a3, a4, a6);
}

- (id)br_addFakeConflictLoserFromItemAtURL:()BRConflictWinner lastEditorDeviceName:error:
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!BRIsFPFSEnabled(v9, v10))
  {
    v15 = [MEMORY[0x1E4F63BE8] manager];
    id v11 = [v15 permanentStorageForItemAtURL:a1 allocateIfNone:1 error:a5];

    if (v11)
    {
      v46 = @"BRConflictLosersLastEditorDeviceNameKey";
      v47[0] = v9;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
      uint64_t v17 = *MEMORY[0x1E4F63B90];
      uint64_t v30 = *MEMORY[0x1E4F63BD0];
      v45[0] = *MEMORY[0x1E4F63BD0];
      uint64_t v18 = *MEMORY[0x1E4F63B88];
      v44[0] = v17;
      v44[1] = v18;
      v19 = [MEMORY[0x1E4F29128] UUID];
      v20 = [v19 UUIDString];
      v21 = [@"fakeloser_" stringByAppendingString:v20];
      v45[1] = v21;
      v44[2] = *MEMORY[0x1E4F63BB0];
      v45[2] = v16;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];

      v23 = [v11 prepareAdditionCreationWithItemAtURL:v8 byMoving:1 creationInfo:v22 error:a5];
      if (v23)
      {
        dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v42 = __Block_byref_object_copy__7;
        *(void *)&long long v43 = __Block_byref_object_dispose__7;
        *((void *)&v43 + 1) = 0;
        uint64_t v35 = 0;
        v36 = &v35;
        uint64_t v37 = 0x3032000000;
        v38 = __Block_byref_object_copy__7;
        v39 = __Block_byref_object_dispose__7;
        id v40 = 0;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __91__NSURL_BRConflictWinner__br_addFakeConflictLoserFromItemAtURL_lastEditorDeviceName_error___block_invoke;
        v31[3] = &unk_1E59AEB88;
        v33 = &v35;
        v34 = buf;
        v25 = v24;
        v32 = v25;
        [v11 createAdditionStagedAtURL:v23 creationInfo:v22 completionHandler:v31];
        if (a5) {
          *a5 = (id) v36[5];
        }
        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        v26 = (void *)MEMORY[0x1E4F28CA0];
        v27 = [*(id *)(*(void *)&buf[8] + 40) name];
        objc_msgSend(v26, "__itemAtURL:didGainVersionWithClientID:name:purposeID:", a1, v30, v27, 0);

        id v14 = *(id *)(*(void *)&buf[8] + 40);
        _Block_object_dispose(&v35, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_14;
      }
    }
    else
    {
      v22 = 0;
      v16 = 0;
    }
    id v14 = 0;
LABEL_14:

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_br_addFakeConflictLoserFromItemAtURL_lastEditorDeviceName_error_);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = brc_bread_crumbs((uint64_t)"-[NSURL(BRConflictWinner) br_addFakeConflictLoserFromItemAtURL:lastEditorDeviceName:error:]", 162);
    v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      v29 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[NSURL(BRConflictWinner) br_addFakeConflictLoserFromItemAtURL:lastEditorDeviceName:error:]";
      *(_WORD *)&buf[12] = 2080;
      if (!a5) {
        v29 = "(ignored by caller)";
      }
      *(void *)&buf[14] = v29;
      *(_WORD *)&buf[22] = 2112;
      v42 = (uint64_t (*)(uint64_t, uint64_t))v11;
      LOWORD(v43) = 2112;
      *(void *)((char *)&v43 + 2) = v12;
      _os_log_error_impl(&dword_19ED3F000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5)
  {
    id v11 = v11;
    id v14 = 0;
    *a5 = v11;
  }
  else
  {
    id v14 = 0;
  }
LABEL_16:

  return v14;
}

@end