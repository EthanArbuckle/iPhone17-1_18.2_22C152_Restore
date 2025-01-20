@interface DOCIntentLocation
+ (DOCIntentLocation)intentLocationWithIdentifier:(id)a3 displayString:(id)a4 type:(id)a5;
+ (DOCIntentLocation)intentLocationWithItem:(id)a3;
+ (DOCIntentLocation)intentLocationWithTag:(id)a3;
+ (id)imageForType:(id)a3;
@end

@implementation DOCIntentLocation

+ (DOCIntentLocation)intentLocationWithIdentifier:(id)a3 displayString:(id)a4 type:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [DOCIntentLocation alloc];
  v11 = +[DOCIntentLocation imageForType:v7];
  v12 = [(DOCIntentLocation *)v10 initWithIdentifier:v9 displayString:v8 subtitleString:0 displayImage:v11];

  [(DOCIntentLocation *)v12 setLocationType:v7];
  [(DOCIntentLocation *)v12 setLocationIdentifier:v9];

  return v12;
}

+ (DOCIntentLocation)intentLocationWithTag:(id)a3
{
  id v3 = a3;
  v4 = [v3 displayName];
  v5 = [v3 displayName];

  v6 = +[DOCIntentLocation intentLocationWithIdentifier:v4 displayString:v5 type:@"tag"];

  return (DOCIntentLocation *)v6;
}

+ (DOCIntentLocation)intentLocationWithItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 itemIdentifier];
  v5 = [v3 displayName];
  v6 = +[DOCIntentLocation intentLocationWithIdentifier:v4 displayString:v5 type:@"location"];

  id v7 = [v3 itemID];
  id v8 = [v7 identifier];
  [v6 setLocationIdentifier:v8];

  id v9 = [v3 itemID];

  v10 = [v9 providerDomainID];
  [v6 setDomainIdentifier:v10];

  return (DOCIntentLocation *)v6;
}

+ (id)imageForType:(id)a3
{
  id v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == @"location") {
    goto LABEL_12;
  }
  if (v3 == @"tag")
  {
    id v7 = (void *)MEMORY[0x263F0FB88];
    id v8 = @"circle";
    goto LABEL_17;
  }
  if (v3 == @"recents")
  {
    id v7 = (void *)MEMORY[0x263F0FB88];
    id v8 = @"clock";
    goto LABEL_17;
  }
  if (v3 == @"shared")
  {
    id v7 = (void *)MEMORY[0x263F0FB88];
    id v8 = @"folder.badge.person.crop";
    goto LABEL_17;
  }
  if (v3 == @"downloads")
  {
    id v7 = (void *)MEMORY[0x263F0FB88];
    id v8 = @"arrow.down.circle";
    goto LABEL_17;
  }
  if (v3 == @"customFolder")
  {
LABEL_12:
    id v7 = (void *)MEMORY[0x263F0FB88];
    id v8 = @"folder";
LABEL_17:
    v6 = [v7 systemImageNamed:v8];
    goto LABEL_18;
  }
  v5 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    v10 = (NSObject **)MEMORY[0x263F3AC28];
    DOCInitLogging();
    v5 = *v10;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    +[DOCIntentLocation(DOCIntentsExtensions) imageForType:]((uint64_t)v4, v5);
  }
  v6 = 0;
LABEL_18:

  return v6;
}

@end