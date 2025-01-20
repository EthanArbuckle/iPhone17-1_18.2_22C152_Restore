@interface _CLRangingPeerDistance
+ (BOOL)supportsSecureCoding;
- (BOOL)initiator;
- (BOOL)isInitiator;
- (BOOL)shouldUnlock;
- (NSDate)date;
- (NSNumber)accuracyMeters;
- (NSNumber)distanceMeters;
- (_CLRangingPeer)peer;
- (_CLRangingPeerDistance)init;
- (_CLRangingPeerDistance)initWithCoder:(id)a3;
- (_CLRangingPeerDistance)initWithPeer:(id)a3 date:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7;
- (_CLRangingPeerDistance)initWithPeer:(id)a3 date:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7 shouldUnlock:(BOOL)a8;
- (_CLRangingPeerDistance)initWithPeer:(id)a3 timestamp:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLRangingPeerDistance

- (_CLRangingPeerDistance)init
{
  return 0;
}

- (_CLRangingPeerDistance)initWithPeer:(id)a3 timestamp:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7
{
  return (_CLRangingPeerDistance *)MEMORY[0x1F4181798](self, sel_initWithPeer_date_distanceMeters_accuracyMeters_initiator_);
}

- (_CLRangingPeerDistance)initWithPeer:(id)a3 date:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7
{
  return [(_CLRangingPeerDistance *)self initWithPeer:a3 date:a4 distanceMeters:a5 accuracyMeters:a6 initiator:a7 shouldUnlock:0];
}

- (_CLRangingPeerDistance)initWithPeer:(id)a3 date:(id)a4 distanceMeters:(id)a5 accuracyMeters:(id)a6 initiator:(BOOL)a7 shouldUnlock:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 377, @"Invalid parameter not satisfying: %@", @"peer");
    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_4;
      }
LABEL_10:
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 379, @"Invalid parameter not satisfying: %@", @"distance");
      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 378, @"Invalid parameter not satisfying: %@", @"date");
  if (!a5) {
    goto LABEL_10;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 380, @"Invalid parameter not satisfying: %@", @"accuracy");
LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)_CLRangingPeerDistance;
  v16 = [(_CLRangingPeerDistance *)&v18 init];
  if (v16) {
    v16->_internal = [[_CLRangingPeerDistanceInternal alloc] initWithPeer:a3 date:a4 distanceMeters:a5 accuracyMeters:a6 initiator:v9 shouldUnlock:v8];
  }
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLRangingPeerDistance;
  [(_CLRangingPeerDistance *)&v3 dealloc];
}

- (_CLRangingPeer)peer
{
  return (_CLRangingPeer *)*((void *)self->_internal + 1);
}

- (NSDate)date
{
  return (NSDate *)*((void *)self->_internal + 2);
}

- (NSNumber)distanceMeters
{
  return (NSNumber *)*((void *)self->_internal + 3);
}

- (NSNumber)accuracyMeters
{
  return (NSNumber *)*((void *)self->_internal + 4);
}

- (BOOL)shouldUnlock
{
  return *((unsigned char *)self->_internal + 41);
}

- (BOOL)initiator
{
  return *((unsigned char *)self->_internal + 40);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  internal = self->_internal;
  uint64_t v6 = internal[1];
  uint64_t v7 = internal[2];
  uint64_t v8 = internal[3];
  uint64_t v9 = internal[4];
  uint64_t v10 = *((unsigned __int8 *)internal + 40);
  uint64_t v11 = *((unsigned __int8 *)internal + 41);

  return (id)[v4 initWithPeer:v6 date:v7 distanceMeters:v8 accuracyMeters:v9 initiator:v10 shouldUnlock:v11];
}

- (_CLRangingPeerDistance)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 455, @"Invalid parameter not satisfying: %@", @"[aDecoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLCodingKeyRangingPeerDistancePeer"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLCodingKeyRangingPeerDistanceTimestamp"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLCodingKeyRangingPeerDistanceDistance"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCLCodingKeyRangingPeerDistanceAccuracy"];
  uint64_t v10 = [a3 decodeBoolForKey:@"kCLCodingKeyRangingPeerDistanceInitiator"];
  uint64_t v11 = [a3 decodeBoolForKey:@"kCLCodingKeyRangingPeerDistanceUnlock"];

  return [(_CLRangingPeerDistance *)self initWithPeer:v6 date:v7 distanceMeters:v8 accuracyMeters:v9 initiator:v10 shouldUnlock:v11];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLRangingPeer.m", 469, @"Invalid parameter not satisfying: %@", @"[aCoder allowsKeyedCoding]");
  }
  internal = self->_internal;
  [a3 encodeObject:internal[1] forKey:@"kCLCodingKeyRangingPeerDistancePeer"];
  [a3 encodeObject:internal[2] forKey:@"kCLCodingKeyRangingPeerDistanceTimestamp"];
  [a3 encodeObject:internal[3] forKey:@"kCLCodingKeyRangingPeerDistanceDistance"];
  [a3 encodeObject:internal[4] forKey:@"kCLCodingKeyRangingPeerDistanceAccuracy"];
  [a3 encodeBool:*((unsigned __int8 *)internal + 40) forKey:@"kCLCodingKeyRangingPeerDistanceInitiator"];
  uint64_t v7 = *((unsigned __int8 *)internal + 41);

  [a3 encodeBool:v7 forKey:@"kCLCodingKeyRangingPeerDistanceUnlock"];
}

- (id)description
{
  internal = (id *)self->_internal;
  objc_super v3 = NSString;
  uint64_t v4 = [internal[1] getMacAddressAsString];
  id v5 = internal[2];
  [internal[3] floatValue];
  double v7 = v6;
  [internal[4] floatValue];
  double v9 = v8;
  if (*((unsigned char *)internal + 41)) {
    uint64_t v10 = "Yes";
  }
  else {
    uint64_t v10 = "No";
  }
  if ([internal[1] secureRangingKeyID]) {
    uint64_t v11 = "Yes";
  }
  else {
    uint64_t v11 = "No";
  }
  if (*((unsigned char *)internal + 40)) {
    v12 = "Yes";
  }
  else {
    v12 = "No";
  }
  return (id)[v3 stringWithFormat:@"Peer: %@ time:%@ distance[m]:%.02f accuracy[m]:%.02f unlock:%s secure:%s initiator:%s", v4, v5, *(void *)&v7, *(void *)&v9, v10, v11, v12];
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

@end