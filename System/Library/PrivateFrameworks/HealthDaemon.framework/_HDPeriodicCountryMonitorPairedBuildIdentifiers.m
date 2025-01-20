@interface _HDPeriodicCountryMonitorPairedBuildIdentifiers
- (NSString)buildIdentifier;
- (NSString)pairingIdentifier;
- (_HDPeriodicCountryMonitorPairedBuildIdentifiers)initWithPairingIdentifier:(id)a3 buildIdentifier:(id)a4;
@end

@implementation _HDPeriodicCountryMonitorPairedBuildIdentifiers

- (_HDPeriodicCountryMonitorPairedBuildIdentifiers)initWithPairingIdentifier:(id)a3 buildIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HDPeriodicCountryMonitorPairedBuildIdentifiers;
  v8 = [(_HDPeriodicCountryMonitorPairedBuildIdentifiers *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    pairingIdentifier = v8->_pairingIdentifier;
    v8->_pairingIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    buildIdentifier = v8->_buildIdentifier;
    v8->_buildIdentifier = (NSString *)v11;
  }
  return v8;
}

- (NSString)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (NSString)buildIdentifier
{
  return self->_buildIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildIdentifier, 0);

  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
}

@end