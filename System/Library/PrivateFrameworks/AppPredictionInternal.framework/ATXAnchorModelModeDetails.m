@interface ATXAnchorModelModeDetails
- (ATXAnchorModelModeDetails)initWithModeUUID:(id)a3 isStart:(BOOL)a4;
- (BOOL)isStart;
- (NSString)modeUUID;
@end

@implementation ATXAnchorModelModeDetails

- (ATXAnchorModelModeDetails)initWithModeUUID:(id)a3 isStart:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAnchorModelModeDetails;
  v7 = [(ATXAnchorModelModeDetails *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    modeUUID = v7->_modeUUID;
    v7->_modeUUID = (NSString *)v8;

    v7->_isStart = a4;
  }

  return v7;
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void).cxx_destruct
{
}

@end