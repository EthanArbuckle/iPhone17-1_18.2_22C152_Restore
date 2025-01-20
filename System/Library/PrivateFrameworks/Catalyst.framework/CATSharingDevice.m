@interface CATSharingDevice
+ (id)unlocalizedDescriptivePairingStateForPairingState:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)isPaired;
- (CATSharingDevice)initWithIdentifier:(id)a3 modelIdentifier:(id)a4 RSSI:(int64_t)a5 paired:(BOOL)a6 pairingState:(unint64_t)a7 detectionTime:(id)a8;
- (NSDate)detectionTime;
- (NSString)modelIdentifier;
- (NSUUID)identifier;
- (id)debugDescription;
- (int64_t)RSSI;
- (unint64_t)hash;
- (unint64_t)pairingState;
@end

@implementation CATSharingDevice

- (CATSharingDevice)initWithIdentifier:(id)a3 modelIdentifier:(id)a4 RSSI:(int64_t)a5 paired:(BOOL)a6 pairingState:(unint64_t)a7 detectionTime:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)CATSharingDevice;
  v18 = [(CATSharingDevice *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    uint64_t v20 = [v16 copy];
    modelIdentifier = v19->_modelIdentifier;
    v19->_modelIdentifier = (NSString *)v20;

    v19->_paired = a6;
    v19->_RSSI = a5;
    v19->_pairingState = a7;
    objc_storeStrong((id *)&v19->_detectionTime, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CATSharingDevice *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    BOOL v7 = [(CATSharingDevice *)self isEqualToDevice:v6];
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = [(CATSharingDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CATSharingDevice *)self identifier];
  v6 = [v5 UUIDString];
  BOOL v7 = [(CATSharingDevice *)self modelIdentifier];
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[CATSharingDevice RSSI](self, "RSSI"));
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CATSharingDevice isPaired](self, "isPaired"));
  v10 = +[CATSharingDevice unlocalizedDescriptivePairingStateForPairingState:[(CATSharingDevice *)self pairingState]];
  v11 = [(CATSharingDevice *)self detectionTime];
  v12 = [v3 stringWithFormat:@"<%@: %p> identifier: %@, modelIdentifier: %@, RSSI: %@, paired: %@, pairingState: %@, detectionTime: %@", v4, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4 = a3;
  if (v4 && [v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(CATSharingDevice *)self identifier];
    v6 = [v5 UUIDString];
    BOOL v7 = [v4 identifier];
    v8 = [v7 UUIDString];
    if ([v6 isEqualToString:v8])
    {
      v9 = [(CATSharingDevice *)self modelIdentifier];
      v10 = [v4 modelIdentifier];
      char v11 = [v9 isEqualToString:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)unlocalizedDescriptivePairingStateForPairingState:(unint64_t)a3
{
  if (a3 >= 4)
  {
    id v4 = NSString;
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    unint64_t v3 = [v4 stringWithFormat:@"Unknown pairingState: %@", v5];
  }
  else
  {
    unint64_t v3 = off_2641DC470[a3];
  }

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (int64_t)RSSI
{
  return self->_RSSI;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (unint64_t)pairingState
{
  return self->_pairingState;
}

- (NSDate)detectionTime
{
  return self->_detectionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionTime, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end