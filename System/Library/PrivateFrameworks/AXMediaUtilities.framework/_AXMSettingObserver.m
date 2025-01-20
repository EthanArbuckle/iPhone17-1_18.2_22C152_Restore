@interface _AXMSettingObserver
@end

@implementation _AXMSettingObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->callback, 0);

  objc_destroyWeak(&self->observer);
}

@end