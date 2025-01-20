@interface CRInsightsContext
- (CRCameraReader)cameraReader;
- (CRInsightsContext)init;
- (CRInsightsContext)initWithContext:(id)a3;
- (NSMutableDictionary)info;
- (id)description;
- (id)valueForKey:(id)a3;
- (void)setCameraReader:(id)a3;
- (void)setInfo:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation CRInsightsContext

- (CRInsightsContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRInsightsContext;
  v2 = [(CRInsightsContext *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(CRInsightsContext *)v2 setInfo:v3];
  }
  return v2;
}

- (CRInsightsContext)initWithContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRInsightsContext;
  objc_super v5 = [(CRInsightsContext *)&v11 init];
  if (v5)
  {
    v6 = [v4 cameraReader];
    [(CRInsightsContext *)v5 setCameraReader:v6];

    v7 = (void *)MEMORY[0x263EFF9A0];
    v8 = [v4 info];
    v9 = [v7 dictionaryWithDictionary:v8];
    [(CRInsightsContext *)v5 setInfo:v9];
  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRInsightsContext *)self info];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(CRInsightsContext *)self info];
  v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CRInsightsContext *)self cameraReader];
  objc_super v5 = [(CRInsightsContext *)self info];
  id v6 = [v5 description];
  v7 = [v3 stringWithFormat:@"CRInsightsContext %p\r{\rCamera reader: %p\rKey-value pairs:\r%@\r}", self, v4, v6];

  return v7;
}

- (NSMutableDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (CRCameraReader)cameraReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraReader);
  return (CRCameraReader *)WeakRetained;
}

- (void)setCameraReader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cameraReader);
  objc_storeStrong((id *)&self->_info, 0);
}

@end