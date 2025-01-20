@interface ASDTDeviceList
- (ASDTDeviceList)init;
- (BOOL)addAudioDeviceWithCheck:(id)a3;
- (NSArray)audioDevices;
- (NSLock)lock;
- (NSMutableDictionary)audioDeviceDict;
- (NSMutableDictionary)interestsDict;
- (id)getAudioDeviceWithUID:(id)a3;
- (void)addAudioDevices:(id)a3;
- (void)init;
- (void)notifyOfInterest:(int)a3 forDevice:(id)a4;
- (void)registerObject:(id)a3 withInterests:(int)a4 forUID:(id)a5;
- (void)removeAudioDevice:(id)a3;
- (void)removeAudioDeviceWithUID:(id)a3;
- (void)removeAudioDevices:(id)a3;
- (void)setAudioDeviceDict:(id)a3;
- (void)setInterestsDict:(id)a3;
- (void)setLock:(id)a3;
@end

@implementation ASDTDeviceList

- (ASDTDeviceList)init
{
  v15.receiver = self;
  v15.super_class = (Class)ASDTDeviceList;
  v2 = [(ASDTDeviceList *)&v15 init];
  if (!v2) {
    goto LABEL_5;
  }
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [(ASDTDeviceList *)v2 setAudioDeviceDict:v3];

  v4 = [MEMORY[0x263EFF9A0] dictionary];
  [(ASDTDeviceList *)v2 setInterestsDict:v4];

  id v5 = objc_alloc_init(MEMORY[0x263F08958]);
  [(ASDTDeviceList *)v2 setLock:v5];

  v6 = [(ASDTDeviceList *)v2 lock];
  [v6 setName:@"com.apple.AudioServerDriverTransports.ASDTDeviceList"];

  uint64_t v7 = [(ASDTDeviceList *)v2 lock];
  if (v7)
  {
    v8 = (void *)v7;
    uint64_t v9 = [(ASDTDeviceList *)v2 audioDeviceDict];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [(ASDTDeviceList *)v2 interestsDict];

      if (v11)
      {
LABEL_5:
        v12 = v2;
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  v13 = ASDTBaseLogType();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ASDTDeviceList init](v13);
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (NSArray)audioDevices
{
  v3 = [(ASDTDeviceList *)self lock];
  [v3 lock];

  v4 = [(ASDTDeviceList *)self audioDeviceDict];
  id v5 = [v4 allValues];

  v6 = [(ASDTDeviceList *)self lock];
  [v6 unlock];

  return (NSArray *)v5;
}

- (id)getAudioDeviceWithUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(ASDTDeviceList *)self lock];
    [v5 lock];

    v6 = [(ASDTDeviceList *)self audioDeviceDict];
    uint64_t v7 = [v6 objectForKey:v4];

    v8 = [(ASDTDeviceList *)self lock];
    [v8 unlock];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (BOOL)addAudioDeviceWithCheck:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceUID];

  if (v5)
  {
    v6 = [(ASDTDeviceList *)self lock];
    [v6 lock];

    uint64_t v7 = [(ASDTDeviceList *)self audioDeviceDict];
    v8 = [v4 deviceUID];
    [v7 setObject:v4 forKey:v8];

    uint64_t v9 = [(ASDTDeviceList *)self lock];
    [v9 unlock];

    [(ASDTDeviceList *)self notifyOfInterest:1 forDevice:v4];
  }
  else
  {
    v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASDTDeviceList addAudioDeviceWithCheck:](v4, v10);
    }
  }
  return v5 != 0;
}

- (void)addAudioDevices:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(ASDTDeviceList *)self addAudioDevice:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeAudioDeviceWithUID:(id)a3
{
  id v8 = a3;
  id v4 = -[ASDTDeviceList getAudioDeviceWithUID:](self, "getAudioDeviceWithUID:");
  if (v4)
  {
    [(ASDTDeviceList *)self notifyOfInterest:4 forDevice:v4];
    uint64_t v5 = [(ASDTDeviceList *)self lock];
    [v5 lock];

    uint64_t v6 = [(ASDTDeviceList *)self audioDeviceDict];
    [v6 removeObjectForKey:v8];

    uint64_t v7 = [(ASDTDeviceList *)self lock];
    [v7 unlock];
  }
}

- (void)removeAudioDevice:(id)a3
{
  id v4 = [a3 deviceUID];
  [(ASDTDeviceList *)self removeAudioDeviceWithUID:v4];
}

- (void)removeAudioDevices:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) deviceUID];
        [(ASDTDeviceList *)self removeAudioDeviceWithUID:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)registerObject:(id)a3 withInterests:(int)a4 forUID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  long long v11 = [NSNumber numberWithUnsignedLongLong:v9];
  long long v12 = [(ASDTDeviceList *)self lock];
  [v12 lock];

  long long v13 = [(ASDTDeviceList *)self interestsDict];
  uint64_t v14 = [v13 objectForKey:v10];

  if (v6)
  {
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
      if (!v14)
      {
        uint64_t v15 = ASDTBaseLogType();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[ASDTDeviceList registerObject:withInterests:forUID:](v15, v16, v17, v18, v19, v20, v21, v22);
        }

        v23 = [MEMORY[0x263F08690] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"ASDTDeviceList.m" lineNumber:154 description:@"Memory allocation error."];
      }
      v24 = [(ASDTDeviceList *)self interestsDict];
      [v24 setObject:v14 forKey:v10];
    }
    v25 = [v14 objectForKey:v11];
    if (v25)
    {
      v26 = v25;
      [v25 setInterests:v6];
      if ((v6 & 1) == 0)
      {
LABEL_10:
        v27 = 0;
LABEL_20:
        v40 = [(ASDTDeviceList *)self lock];
        [v40 unlock];

        [v26 notifyOfInterest:1 forDevice:v27];
        goto LABEL_21;
      }
    }
    else
    {
      v26 = +[ASDTDeviceInterest createForObject:v9 withInterests:v6];
      if (!v26)
      {
        v30 = ASDTBaseLogType();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[ASDTDeviceList registerObject:withInterests:forUID:](v30, v31, v32, v33, v34, v35, v36, v37);
        }

        v38 = [MEMORY[0x263F08690] currentHandler];
        [v38 handleFailureInMethod:a2 object:self file:@"ASDTDeviceList.m" lineNumber:161 description:@"Memory allocation error."];
      }
      [v14 setObject:v26 forKey:v11];
      if ((v6 & 1) == 0) {
        goto LABEL_10;
      }
    }
    v39 = [(ASDTDeviceList *)self audioDeviceDict];
    v27 = [v39 objectForKey:v10];

    goto LABEL_20;
  }
  v28 = [v14 objectForKey:v11];
  v26 = v28;
  if (v28)
  {
    [v28 setInterested:0];
    [v14 removeObjectForKey:v11];
  }
  v29 = [(ASDTDeviceList *)self lock];
  [v29 unlock];

LABEL_21:
}

- (void)notifyOfInterest:(int)a3 forDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (!v4)
  {
    uint64_t v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ASDTDeviceList notifyOfInterest:forDevice:](v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"ASDTDeviceList.m" lineNumber:177 description:@"Invalid Arguments."];
  }
  uint64_t v17 = [v7 deviceUID];

  if (v17)
  {
    uint64_t v18 = [(ASDTDeviceList *)self lock];
    [v18 lock];

    uint64_t v19 = [(ASDTDeviceList *)self interestsDict];
    uint64_t v20 = [v7 deviceUID];
    uint64_t v21 = [v19 objectForKey:v20];

    uint64_t v22 = [v21 allValues];
    v23 = [(ASDTDeviceList *)self lock];
    [v23 unlock];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        uint64_t v28 = 0;
        do
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v28++), "notifyOfInterest:forDevice:", v4, v7, (void)v29);
        }
        while (v26 != v28);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v26);
    }
  }
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMutableDictionary)audioDeviceDict
{
  return self->_audioDeviceDict;
}

- (void)setAudioDeviceDict:(id)a3
{
}

- (NSMutableDictionary)interestsDict
{
  return self->_interestsDict;
}

- (void)setInterestsDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestsDict, 0);
  objc_storeStrong((id *)&self->_audioDeviceDict, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "ASDTDeviceList";
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%s: Memory allocation error.", (uint8_t *)&v1, 0xCu);
}

- (void)addAudioDeviceWithCheck:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 deviceUID];
  int v4 = 136315394;
  uint64_t v5 = "ASDTDeviceList";
  __int16 v6 = 2112;
  id v7 = v3;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "%s: Failed adding audio device with UID: %@", (uint8_t *)&v4, 0x16u);
}

- (void)registerObject:(uint64_t)a3 withInterests:(uint64_t)a4 forUID:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)notifyOfInterest:(uint64_t)a3 forDevice:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end