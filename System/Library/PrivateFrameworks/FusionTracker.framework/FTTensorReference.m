@interface FTTensorReference
- (NSString)destinationInputName;
- (NSString)sourceNetworkName;
- (NSString)sourceOutputName;
- (void)setDestinationInputName:(id)a3;
- (void)setSourceNetworkName:(id)a3;
- (void)setSourceOutputName:(id)a3;
@end

@implementation FTTensorReference

- (NSString)sourceNetworkName
{
  return self->_sourceNetworkName;
}

- (void)setSourceNetworkName:(id)a3
{
}

- (NSString)sourceOutputName
{
  return self->_sourceOutputName;
}

- (void)setSourceOutputName:(id)a3
{
}

- (NSString)destinationInputName
{
  return self->_destinationInputName;
}

- (void)setDestinationInputName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationInputName, 0);
  objc_storeStrong((id *)&self->_sourceOutputName, 0);

  objc_storeStrong((id *)&self->_sourceNetworkName, 0);
}

@end