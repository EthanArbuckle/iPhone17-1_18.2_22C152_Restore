@interface CLKVideo
+ (CLKVideo)videoWithName:(id)a3 forDevice:(id)a4 url:(id)a5;
+ (id)_videoNamed:(id)a3 device:(id)a4 bundle:(id)a5 modifier:(id)a6;
+ (id)videoAtURL:(id)a3 forDevice:(id)a4;
+ (id)videoNamed:(id)a3 forDevice:(id)a4;
+ (id)videoNamed:(id)a3 forDevice:(id)a4 inBundle:(id)a5;
- (CLKVideo)initWithName:(id)a3 forDevice:(id)a4 url:(id)a5;
- (NSString)name;
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation CLKVideo

+ (id)videoNamed:(id)a3 forDevice:(id)a4
{
  v5 = (void *)MEMORY[0x263F086E0];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 mainBundle];
  v9 = +[CLKVideo videoNamed:v7 forDevice:v6 inBundle:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  device = self->_device;
  name = self->_name;
  url = self->_url;

  return (id)[v4 initWithName:name forDevice:device url:url];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> name = %@, url = %@>", objc_opt_class(), self, self->_name, self->_url];
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

+ (id)_videoNamed:(id)a3 device:(id)a4 bundle:(id)a5 modifier:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (_videoNamed_device_bundle_modifier__onceToken != -1) {
    dispatch_once(&_videoNamed_device_bundle_modifier__onceToken, &__block_literal_global_17);
  }
  v13 = [v9 stringByAppendingString:v12];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = (id)_videoNamed_device_bundle_modifier__movieExtensions;
  v15 = (void *)[v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = objc_msgSend(v11, "URLForResource:withExtension:", v13, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        if (v18)
        {
          v19 = (void *)v18;
          v15 = +[CLKVideo videoWithName:v9 forDevice:v10 url:v18];

          goto LABEL_13;
        }
      }
      v15 = (void *)[v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v15;
}

void __56__CLKVideo_private___videoNamed_device_bundle_modifier___block_invoke()
{
  v0 = (void *)_videoNamed_device_bundle_modifier__movieExtensions;
  _videoNamed_device_bundle_modifier__movieExtensions = (uint64_t)&unk_26CCDC600;
}

+ (id)videoNamed:(id)a3 forDevice:(id)a4 inBundle:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock((os_unfair_lock_t)&videoNamed_forDevice_inBundle____lock);
  id WeakRetained = objc_loadWeakRetained(&videoNamed_forDevice_inBundle____cachedDevice);
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    id v13 = objc_loadWeakRetained(&videoNamed_forDevice_inBundle____cachedDevice);
    if (v13 == v9)
    {
      uint64_t v14 = [v9 version];
      uint64_t v15 = videoNamed_forDevice_inBundle____previousCLKDeviceVersion;

      if (v14 == v15) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v16 = objc_storeWeak(&videoNamed_forDevice_inBundle____cachedDevice, v9);
  videoNamed_forDevice_inBundle____previousCLKDeviceVersion = [v9 version];

  __51__CLKVideo_private__videoNamed_forDevice_inBundle___block_invoke(v17, v9);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&videoNamed_forDevice_inBundle____lock);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = (id)videoNamed_forDevice_inBundle__fileModifiers;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = objc_msgSend(a1, "_videoNamed:device:bundle:modifier:", v8, v9, v10, *(void *)(*((void *)&v26 + 1) + 8 * i), (void)v26);
        if (v23)
        {
          long long v24 = (void *)v23;
          goto LABEL_16;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  long long v24 = 0;
LABEL_16:

  return v24;
}

uint64_t __51__CLKVideo_private__videoNamed_forDevice_inBundle___block_invoke(uint64_t a1, void *a2)
{
  [a2 sizeClass];
  uint64_t v2 = _AssetBundleSuffixesForSizeClass();
  uint64_t v3 = videoNamed_forDevice_inBundle__fileModifiers;
  videoNamed_forDevice_inBundle__fileModifiers = v2;

  return MEMORY[0x270F9A758](v2, v3);
}

+ (CLKVideo)videoWithName:(id)a3 forDevice:(id)a4 url:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[CLKVideo alloc] initWithName:v9 forDevice:v8 url:v7];

  return v10;
}

+ (id)videoAtURL:(id)a3 forDevice:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [CLKVideo alloc];
  id v8 = [v6 lastPathComponent];
  id v9 = [(CLKVideo *)v7 initWithName:v8 forDevice:v5 url:v6];

  return v9;
}

- (CLKVideo)initWithName:(id)a3 forDevice:(id)a4 url:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CLKVideo;
  id v11 = [(CLKVideo *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    objc_storeStrong((id *)&v11->_device, a4);
    objc_storeStrong((id *)&v11->_url, a5);
    uint64_t v14 = v11;
  }

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

@end