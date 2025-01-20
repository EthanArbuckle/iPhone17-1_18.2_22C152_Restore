@interface DDMapAction
+ (BOOL)actionAvailableForContact:(id)a3;
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
+ (id)viewControllerProviderClass;
- (DDMapAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (id)commitURL;
- (id)menuActionClasses;
- (id)previewActions;
@end

@implementation DDMapAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  v4 = DDMapsURLForUrlAndResult(a3, a4);
  BOOL v5 = v4 != 0;

  return v5;
}

- (DDMapAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a5;
  v9 = DDMapsURLForUrlAndResult(a3, a4);
  v18.receiver = self;
  v18.super_class = (Class)DDMapAction;
  v10 = [(DDAction *)&v18 initWithURL:v9 result:a4 context:v8];

  if (v10)
  {
    contact = v10->super.super.super._contact;
    if (contact)
    {
      v12 = DDDefaultAddressForContact(contact);
      if (v12)
      {
        v13 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v12 style:0];
        if ([v13 length])
        {
          uint64_t v14 = DDMapURLForString(v13);
          url = v10->super.super.super._url;
          v10->super.super.super._url = (NSURL *)v14;
        }
      }
    }
    v16 = v10;
  }

  return v10;
}

- (id)commitURL
{
  return self->super.super.super._url;
}

+ (id)viewControllerProviderClass
{
  return @"DDRemoteMapViewControllerProvider";
}

- (id)previewActions
{
  v14[5] = *MEMORY[0x1E4F143B8];
  url = self->super.super.super._url;
  if (url)
  {
    char v9 = 0;
    if ([(NSURL *)url dd_isMaps:0 isDirections:&v9])
    {
      if (self->super.super.super._contact || self->super.super.super._result && DDResultHasType())
      {
        v14[0] = objc_opt_class();
        v14[1] = objc_opt_class();
        v14[2] = objc_opt_class();
        v14[3] = objc_opt_class();
        v14[4] = objc_opt_class();
        v4 = (void *)MEMORY[0x1E4F1C978];
        BOOL v5 = v14;
        uint64_t v6 = 5;
      }
      else
      {
        v13[0] = objc_opt_class();
        v13[1] = objc_opt_class();
        v13[2] = objc_opt_class();
        v13[3] = objc_opt_class();
        v4 = (void *)MEMORY[0x1E4F1C978];
        BOOL v5 = v13;
        uint64_t v6 = 4;
      }
      goto LABEL_13;
    }
    if (v9)
    {
      v12[0] = objc_opt_class();
      v12[1] = objc_opt_class();
      v12[2] = objc_opt_class();
      v4 = (void *)MEMORY[0x1E4F1C978];
      BOOL v5 = v12;
    }
    else
    {
      v11[0] = objc_opt_class();
      v11[1] = objc_opt_class();
      v11[2] = objc_opt_class();
      v4 = (void *)MEMORY[0x1E4F1C978];
      BOOL v5 = v11;
    }
  }
  else
  {
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    v4 = (void *)MEMORY[0x1E4F1C978];
    BOOL v5 = v10;
  }
  uint64_t v6 = 3;
LABEL_13:
  v7 = [v4 arrayWithObjects:v5 count:v6];
  return v7;
}

- (id)menuActionClasses
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(DDMapAction *)self previewActions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v17 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
  if ([v3 count]) {
    v10 = v3;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  return v11;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  v3 = DDDefaultAddressForContact(a3);
  BOOL v4 = v3 != 0;

  return v4;
}

@end