@interface _MKLocalSearchExternalTransitLookupParameters
- (CLLocation)transactionLocation;
- (NSArray)stationCodes;
- (NSDate)transactionDate;
- (NSString)sourceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setStationCodes:(id)a3;
- (void)setTransactionDate:(id)a3;
- (void)setTransactionLocation:(id)a3;
@end

@implementation _MKLocalSearchExternalTransitLookupParameters

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSArray *)self->_stationCodes copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_sourceIdentifier copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSDate *)self->_transactionDate copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(CLLocation *)self->_transactionLocation copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  return v4;
}

- (NSArray)stationCodes
{
  return self->_stationCodes;
}

- (void)setStationCodes:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (CLLocation)transactionLocation
{
  return self->_transactionLocation;
}

- (void)setTransactionLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionLocation, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);

  objc_storeStrong((id *)&self->_stationCodes, 0);
}

@end