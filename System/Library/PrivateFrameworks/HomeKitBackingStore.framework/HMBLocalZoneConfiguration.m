@interface HMBLocalZoneConfiguration
- (BOOL)createIfNeeded;
- (BOOL)readOnly;
- (HMBLocalZoneDelegate)delegate;
- (HMBModelContainer)modelContainer;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setCreateIfNeeded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setModelContainer:(id)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation HMBLocalZoneConfiguration

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modelContainer, 0);
}

- (void)setDelegate:(id)a3
{
}

- (HMBLocalZoneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMBLocalZoneDelegate *)WeakRetained;
}

- (void)setModelContainer:(id)a3
{
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (void)setCreateIfNeeded:(BOOL)a3
{
  self->_createIfNeeded = a3;
}

- (BOOL)createIfNeeded
{
  return self->_createIfNeeded;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [+[HMBMutableLocalZoneConfiguration allocWithZone:a3] init];
  [(HMBLocalZoneConfiguration *)v4 setReadOnly:[(HMBLocalZoneConfiguration *)self readOnly]];
  [(HMBLocalZoneConfiguration *)v4 setCreateIfNeeded:[(HMBLocalZoneConfiguration *)self createIfNeeded]];
  v5 = [(HMBLocalZoneConfiguration *)self modelContainer];
  [(HMBLocalZoneConfiguration *)v4 setModelContainer:v5];

  v6 = [(HMBLocalZoneConfiguration *)self delegate];
  [(HMBLocalZoneConfiguration *)v4 setDelegate:v6];

  return v4;
}

@end