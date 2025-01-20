@interface AddDataViewControllerProvider
- (id)addDataViewControllerForDisplayType:(id)a3;
@end

@implementation AddDataViewControllerProvider

- (id)addDataViewControllerForDisplayType:(id)a3
{
  uint64_t v5 = sub_1AD73A600();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *(void *)self->healthStore;
  v10 = self;
  id v11 = a3;
  swift_retain();
  id v12 = objc_msgSend(v10, sel_sharedInstanceForHealthStore_, v9);
  sub_1AD73A5F0();
  v13 = (void *)sub_1AD73A590();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  id v14 = objc_msgSend(v11, sel_wd_addDataViewControllerWithHealthStore_healthToolBox_initialStartDate_, v9, v12, v13);

  swift_release();
  return v14;
}

@end