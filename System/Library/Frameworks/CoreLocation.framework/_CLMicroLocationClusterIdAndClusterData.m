@interface _CLMicroLocationClusterIdAndClusterData
+ (BOOL)supportsSecureCoding;
- (NSString)clusterIdentifier;
- (_CLMicroLocationClusterIdAndClusterData)initWithClusterIdentifier:(id)a3 meanBleRssi:(double)a4 meanUwbRange:(double)a5;
- (_CLMicroLocationClusterIdAndClusterData)initWithCoder:(id)a3;
- (double)meanBLEReceivedSignalStrength;
- (double)meanUWBRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _CLMicroLocationClusterIdAndClusterData

- (_CLMicroLocationClusterIdAndClusterData)initWithClusterIdentifier:(id)a3 meanBleRssi:(double)a4 meanUwbRange:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_CLMicroLocationClusterIdAndClusterData;
  v8 = [(_CLMicroLocationClusterIdAndClusterData *)&v10 init];
  if (v8)
  {
    v8->_clusterIdentifier = (NSString *)[a3 copy];
    v8->_meanBLEReceivedSignalStrength = a4;
    v8->_meanUWBRange = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_CLMicroLocationClusterIdAndClusterData;
  [(_CLMicroLocationClusterIdAndClusterData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v6 = (id)[(NSString *)[(_CLMicroLocationClusterIdAndClusterData *)self clusterIdentifier] copyWithZone:a3];
  [(_CLMicroLocationClusterIdAndClusterData *)self meanBLEReceivedSignalStrength];
  double v8 = v7;
  [(_CLMicroLocationClusterIdAndClusterData *)self meanUWBRange];

  return (id)[v5 initWithClusterIdentifier:v6 meanBleRssi:v8 meanUwbRange:v9];
}

- (_CLMicroLocationClusterIdAndClusterData)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_CLMicroLocationClusterIdAndClusterData;
  v4 = [(_CLMicroLocationClusterIdAndClusterData *)&v8 init];
  if (v4)
  {
    v4->_clusterIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"clusterId"];
    [a3 decodeDoubleForKey:@"meanUwbRange"];
    v4->_meanUWBRange = v5;
    [a3 decodeDoubleForKey:@"meanBleRssi"];
    v4->_meanBLEReceivedSignalStrength = v6;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_clusterIdentifier forKey:@"clusterId"];
  [a3 encodeDouble:@"meanUwbRange" forKey:self->_meanUWBRange];
  double meanBLEReceivedSignalStrength = self->_meanBLEReceivedSignalStrength;

  [a3 encodeDouble:@"meanBleRssi" forKey:meanBLEReceivedSignalStrength];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(_CLMicroLocationClusterIdAndClusterData *)self clusterIdentifier];
  [(_CLMicroLocationClusterIdAndClusterData *)self meanUWBRange];
  uint64_t v6 = v5;
  [(_CLMicroLocationClusterIdAndClusterData *)self meanBLEReceivedSignalStrength];
  return (id)[v3 stringWithFormat:@"clusterIdentifier: %@, meanUwbRange: %.3f(m), meanBleRssi: %.3f(dbm)", v4, v6, v7];
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (double)meanBLEReceivedSignalStrength
{
  return self->_meanBLEReceivedSignalStrength;
}

- (double)meanUWBRange
{
  return self->_meanUWBRange;
}

@end