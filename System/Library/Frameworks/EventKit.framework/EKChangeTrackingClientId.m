@interface EKChangeTrackingClientId
- (CADChangeTrackingClientId)CADChangeTrackingClientId;
- (EKChangeTrackingClientId)init;
- (EKChangeTrackingClientId)initWithCustomClientId:(id)a3;
- (EKChangeTrackingClientId)initWithCustomClientId:(id)a3 suffix:(id)a4;
- (EKChangeTrackingClientId)initWithSuffix:(id)a3;
- (NSString)customClientId;
- (NSString)suffix;
@end

@implementation EKChangeTrackingClientId

- (EKChangeTrackingClientId)initWithCustomClientId:(id)a3
{
  return [(EKChangeTrackingClientId *)self initWithCustomClientId:a3 suffix:0];
}

- (EKChangeTrackingClientId)initWithSuffix:(id)a3
{
  return [(EKChangeTrackingClientId *)self initWithCustomClientId:0 suffix:a3];
}

- (EKChangeTrackingClientId)init
{
  return [(EKChangeTrackingClientId *)self initWithCustomClientId:0 suffix:0];
}

- (EKChangeTrackingClientId)initWithCustomClientId:(id)a3 suffix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKChangeTrackingClientId;
  v8 = [(EKChangeTrackingClientId *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    customClientId = v8->_customClientId;
    v8->_customClientId = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    suffix = v8->_suffix;
    v8->_suffix = (NSString *)v11;
  }
  return v8;
}

- (CADChangeTrackingClientId)CADChangeTrackingClientId
{
  v3 = [(EKChangeTrackingClientId *)self customClientId];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F56940]);
    v5 = [(EKChangeTrackingClientId *)self customClientId];
    uint64_t v6 = [v4 initWithCustomClientId:v5];
LABEL_5:
    id v9 = (id)v6;

    goto LABEL_6;
  }
  id v7 = [(EKChangeTrackingClientId *)self suffix];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F56940]);
    v5 = [(EKChangeTrackingClientId *)self suffix];
    uint64_t v6 = [v8 initWithSuffix:v5];
    goto LABEL_5;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F56940]);
LABEL_6:

  return (CADChangeTrackingClientId *)v9;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (NSString)customClientId
{
  return self->_customClientId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customClientId, 0);

  objc_storeStrong((id *)&self->_suffix, 0);
}

@end