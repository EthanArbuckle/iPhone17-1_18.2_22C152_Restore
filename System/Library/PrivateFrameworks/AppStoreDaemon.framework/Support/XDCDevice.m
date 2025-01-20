@interface XDCDevice
- (id)description;
@end

@implementation XDCDevice

- (id)description
{
  v3 = [(NRDevice *)self->_device pairingID];
  v4 = +[NSString stringWithFormat:@"<XDCDevice: %p pairingID = %@>", self, v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thinningVariant, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end