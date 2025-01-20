@interface SHSonify
+ (id)audioRepresentationOfSignature:(id)a3;
@end

@implementation SHSonify

+ (id)audioRepresentationOfSignature:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = (objc_class *)MEMORY[0x263EF9388];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCommonFormat:3 sampleRate:1 channels:1 interleaved:48000.0];
  v6 = [v4 dataRepresentation];

  [v5 sampleRate];
  id v14 = 0;
  v8 = +[SigSonify sonifySignature:v6 withSampleRate:v7 error:&v14];
  id v9 = v14;

  if ([v8 length])
  {
    id v10 = v8;
    v11 = +[SHAudioUtilities audioBufferFromData:byteSize:inFormat:](SHAudioUtilities, "audioBufferFromData:byteSize:inFormat:", [v10 bytes], objc_msgSend(v10, "length"), v5);
  }
  else
  {
    v12 = sh_log_object();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_224B4B000, v12, OS_LOG_TYPE_ERROR, "Unable to generate audio representation of signature with error %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

@end