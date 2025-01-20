@interface MKLinkPreviewDirectionsMetadata
- (CNPostalAddress)destinationAddressComponents;
- (CNPostalAddress)sourceAddressComponents;
- (NSNumber)distance;
- (NSNumber)transportType;
- (NSString)destinationAddress;
- (NSString)destinationName;
- (NSString)sourceAddress;
- (NSString)sourceName;
- (void)setDestinationAddress:(id)a3;
- (void)setDestinationAddressComponents:(id)a3;
- (void)setDestinationName:(id)a3;
- (void)setDistance:(id)a3;
- (void)setSourceAddress:(id)a3;
- (void)setSourceAddressComponents:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setTransportType:(id)a3;
@end

@implementation MKLinkPreviewDirectionsMetadata

- (NSNumber)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
}

- (NSString)sourceAddress
{
  return self->_sourceAddress;
}

- (void)setSourceAddress:(id)a3
{
}

- (CNPostalAddress)sourceAddressComponents
{
  return self->_sourceAddressComponents;
}

- (void)setSourceAddressComponents:(id)a3
{
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
}

- (NSString)destinationAddress
{
  return self->_destinationAddress;
}

- (void)setDestinationAddress:(id)a3
{
}

- (CNPostalAddress)destinationAddressComponents
{
  return self->_destinationAddressComponents;
}

- (void)setDestinationAddressComponents:(id)a3
{
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_destinationAddressComponents, 0);
  objc_storeStrong((id *)&self->_destinationAddress, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_sourceAddressComponents, 0);
  objc_storeStrong((id *)&self->_sourceAddress, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);

  objc_storeStrong((id *)&self->_transportType, 0);
}

@end