@interface GCLocalPlayerIndicator
- (GCControllerPlayerIndicator)systemPlayerIndicatorProxy;
- (GCLocalPlayerIndicator)initWithInitialValue:(int64_t)a3 systemPlayerIndicatorProxy:(id)a4;
- (NSObject)identifier;
- (int64_t)playerIndex;
- (void)setController:(id)a3;
- (void)setPlayerIndex:(int64_t)a3;
@end

@implementation GCLocalPlayerIndicator

- (GCLocalPlayerIndicator)initWithInitialValue:(int64_t)a3 systemPlayerIndicatorProxy:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GCLocalPlayerIndicator;
  v8 = [(GCLocalPlayerIndicator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_systemPlayerIndicatorProxy, a4);
    v9->_playerIndex = a3;
  }

  return v9;
}

- (void)setController:(id)a3
{
}

- (NSObject)identifier
{
  return [(GCControllerPlayerIndicator *)self->_systemPlayerIndicatorProxy identifier];
}

- (int64_t)playerIndex
{
  return self->_playerIndex;
}

- (void)setPlayerIndex:(int64_t)a3
{
  self->_playerIndex = a3;
  -[GCControllerPlayerIndicator setPlayerIndex:](self->_systemPlayerIndicatorProxy, "setPlayerIndex:");
}

- (GCControllerPlayerIndicator)systemPlayerIndicatorProxy
{
  return self->_systemPlayerIndicatorProxy;
}

- (void).cxx_destruct
{
}

@end