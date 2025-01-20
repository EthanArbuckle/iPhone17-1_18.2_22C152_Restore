@interface AVTRecordView(Downcasting)
- (id)downcastWithAVTViewHandler:()Downcasting recordViewHandler:;
@end

@implementation AVTRecordView(Downcasting)

- (id)downcastWithAVTViewHandler:()Downcasting recordViewHandler:
{
  if (a4)
  {
    v4 = *(uint64_t (**)(uint64_t, void *))(a4 + 16);
    return (id)v4(a4, a1);
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&off_26BFA53A0;
    return objc_msgSendSuper2(&v6, sel_downcastWithAVTViewHandler_recordViewHandler_);
  }
}

@end