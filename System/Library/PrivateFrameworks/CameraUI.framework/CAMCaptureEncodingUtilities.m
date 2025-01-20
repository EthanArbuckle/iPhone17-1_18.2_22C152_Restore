@interface CAMCaptureEncodingUtilities
+ (id)selectPhotoCodecFromAvailableCodecs:(id)a3 withBehavior:(int64_t)a4;
+ (id)selectVideoCodecFromAvailableCodecs:(id)a3 withBehavior:(int64_t)a4;
@end

@implementation CAMCaptureEncodingUtilities

+ (id)selectPhotoCodecFromAvailableCodecs:(id)a3 withBehavior:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 == 1)
  {
    v7 = (void *)*MEMORY[0x263EFA370];
    if ([v5 containsObject:*MEMORY[0x263EFA370]])
    {
LABEL_5:
      id v8 = v7;
      if (v8) {
        goto LABEL_7;
      }
    }
  }
  else if (!a4)
  {
    v7 = (void *)*MEMORY[0x263EFA380];
    goto LABEL_5;
  }
  id v8 = [v6 firstObject];
LABEL_7:

  return v8;
}

+ (id)selectVideoCodecFromAvailableCodecs:(id)a3 withBehavior:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((unint64_t)a4 > 2) {
    id v6 = 0;
  }
  else {
    id v6 = **((id **)&unk_263FA0768 + a4);
  }
  if ([v5 containsObject:v6])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = [v5 objectAtIndex:0];
    id v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543874;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Failed to find desired codec %{public}@, using default of %{public}@ (available = %{public}@)", (uint8_t *)&v10, 0x20u);
    }
  }
  return v7;
}

@end