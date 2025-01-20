@interface CKGroupUpdateBannerView
- (CKGroupUpdateBannerView)init;
- (NSArray)groupUpdates;
- (int64_t)updateBannerType;
- (void)setGroupUpdates:(id)a3;
- (void)setUpdateBannerType:(int64_t)a3;
@end

@implementation CKGroupUpdateBannerView

- (CKGroupUpdateBannerView)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKGroupUpdateBannerView;
  v2 = [(CKGroupUpdateBannerView *)&v6 init];
  v3 = v2;
  if (v2)
  {
    groupUpdates = v2->_groupUpdates;
    v2->_groupUpdates = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_updateBannerType = 0;
  }
  return v3;
}

- (NSArray)groupUpdates
{
  return self->_groupUpdates;
}

- (void)setGroupUpdates:(id)a3
{
}

- (int64_t)updateBannerType
{
  return self->_updateBannerType;
}

- (void)setUpdateBannerType:(int64_t)a3
{
  self->_updateBannerType = a3;
}

- (void).cxx_destruct
{
}

@end