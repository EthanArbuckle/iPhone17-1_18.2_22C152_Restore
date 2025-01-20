@interface IMAudioController_iOS
- (IMAudioController_iOS)initWithContentsOfURLs:(id)a3;
- (void)applicationWillResignActive;
- (void)audioSessionInterruption:(id)a3;
- (void)dealloc;
@end

@implementation IMAudioController_iOS

- (IMAudioController_iOS)initWithContentsOfURLs:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IMAudioController_iOS;
  v5 = [(IMAudioController *)&v10 initWithContentsOfURLs:a3];
  if (v5)
  {
    v6 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], v3, v4);
    objc_msgSend_addObserver_selector_name_object_(v6, v7, (uint64_t)v5, sel_audioSessionInterruption_, *MEMORY[0x263EF90A0], 0);
    objc_msgSend_addObserver_selector_name_object_(v6, v8, (uint64_t)v5, sel_applicationWillResignActive, *MEMORY[0x263F1D0D8], 0);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)IMAudioController_iOS;
  [(IMAudioController *)&v6 dealloc];
}

- (void)audioSessionInterruption:(id)a3
{
  objc_msgSend_setInterrupted_(self, a2, 1);
  objc_super v6 = objc_msgSend_audioPlayer(self, v4, v5);
  objc_msgSend_stop(v6, v7, v8);

  objc_msgSend_setInterrupted_(self, v9, 0);
}

- (void)applicationWillResignActive
{
  objc_msgSend_audioPlayer(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stop(v5, v3, v4);
}

@end