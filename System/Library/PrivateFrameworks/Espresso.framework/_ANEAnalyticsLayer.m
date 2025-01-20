@interface _ANEAnalyticsLayer
+ (id)objectWithName:(id)a3 weight:(id)a4;
- (NSNumber)weight;
- (NSString)layerName;
- (_ANEAnalyticsLayer)initWithName:(id)a3 weight:(id)a4;
- (id)serialize;
@end

@implementation _ANEAnalyticsLayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weight, 0);

  objc_storeStrong((id *)&self->_layerName, 0);
}

- (NSNumber)weight
{
  return self->_weight;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (id)serialize
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(_ANEAnalyticsLayer *)self layerName];
  v10 = v3;
  v8 = @"weight";
  v4 = [(_ANEAnalyticsLayer *)self weight];
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

- (_ANEAnalyticsLayer)initWithName:(id)a3 weight:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_ANEAnalyticsLayer;
  v9 = [(_ANEAnalyticsLayer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layerName, a3);
    objc_storeStrong((id *)&v10->_weight, a4);
  }

  return v10;
}

+ (id)objectWithName:(id)a3 weight:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)a1) initWithName:v6 weight:v7];

  return v8;
}

@end