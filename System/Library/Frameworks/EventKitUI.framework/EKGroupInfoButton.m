@interface EKGroupInfoButton
- (CUIKGroupInfo)groupInfo;
- (void)setGroupInfo:(id)a3;
@end

@implementation EKGroupInfoButton

- (CUIKGroupInfo)groupInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupInfo);

  return (CUIKGroupInfo *)WeakRetained;
}

- (void)setGroupInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end