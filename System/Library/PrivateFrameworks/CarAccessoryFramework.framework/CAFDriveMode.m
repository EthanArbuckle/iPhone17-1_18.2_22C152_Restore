@interface CAFDriveMode
+ (id)observerProtocol;
+ (id)serviceIdentifier;
+ (void)load;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation CAFDriveMode

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDriveMode;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDAA258]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFDriveMode;
  [(CAFModeItems *)&v6 registerObserver:v5];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_26FDAA258]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CAFDriveMode;
  [(CAFModeItems *)&v6 unregisterObserver:v5];
}

+ (id)serviceIdentifier
{
  return @"0x000000001A000008";
}

+ (id)observerProtocol
{
  return &unk_26FDB19C0;
}

@end