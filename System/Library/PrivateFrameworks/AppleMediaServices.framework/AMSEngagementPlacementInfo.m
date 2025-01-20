@interface AMSEngagementPlacementInfo
- (AMSEngagementPlacementInfo)initWithPlacement:(id)a3 context:(id)a4;
- (BOOL)supportsMultipleMessages;
- (NSDictionary)context;
- (NSString)placement;
- (id)makeRawDictionary;
- (void)setSupportsMultipleMessages:(BOOL)a3;
@end

@implementation AMSEngagementPlacementInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setSupportsMultipleMessages:(BOOL)a3
{
  self->_supportsMultipleMessages = a3;
}

- (id)makeRawDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(AMSEngagementPlacementInfo *)self placement];
  [v3 setObject:v4 forKeyedSubscript:@"placement"];

  v5 = [(AMSEngagementPlacementInfo *)self context];

  v6 = (void *)MEMORY[0x1E4F1CA60];
  if (v5)
  {
    v7 = [(AMSEngagementPlacementInfo *)self context];
    v8 = [v6 dictionaryWithDictionary:v7];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  if ([(AMSEngagementPlacementInfo *)self supportsMultipleMessages])
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSEngagementPlacementInfo supportsMultipleMessages](self, "supportsMultipleMessages"));
    [v8 setObject:v9 forKeyedSubscript:@"supportsMultipleMessages"];
  }
  if ([v8 count])
  {
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v8];
    [v3 setObject:v10 forKeyedSubscript:@"context"];
  }
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return v11;
}

- (NSDictionary)context
{
  return self->_context;
}

- (BOOL)supportsMultipleMessages
{
  return self->_supportsMultipleMessages;
}

- (NSString)placement
{
  return self->_placement;
}

- (AMSEngagementPlacementInfo)initWithPlacement:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSEngagementPlacementInfo;
  v9 = [(AMSEngagementPlacementInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placement, a3);
    objc_storeStrong((id *)&v10->_context, a4);
    v10->_supportsMultipleMessages = 0;
  }

  return v10;
}

@end