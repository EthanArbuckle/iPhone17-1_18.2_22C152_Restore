@interface CTSignalStrengthMeasurements
+ (BOOL)supportsSecureCoding;
- (CTSignalStrengthMeasurements)initWithCoder:(id)a3;
- (NSNumber)ecio;
- (NSNumber)ecn0;
- (NSNumber)rscp;
- (NSNumber)rsrp;
- (NSNumber)rsrq;
- (NSNumber)rssi;
- (NSNumber)rxagc;
- (NSNumber)snr;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEcio:(id)a3;
- (void)setEcn0:(id)a3;
- (void)setRscp:(id)a3;
- (void)setRsrp:(id)a3;
- (void)setRsrq:(id)a3;
- (void)setRssi:(id)a3;
- (void)setRxagc:(id)a3;
- (void)setSnr:(id)a3;
@end

@implementation CTSignalStrengthMeasurements

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSignalStrengthMeasurements *)self rssi];

  if (v4)
  {
    v5 = [(CTSignalStrengthMeasurements *)self rssi];
    [v3 appendFormat:@", rssi=%@", v5];
  }
  v6 = [(CTSignalStrengthMeasurements *)self rscp];

  if (v6)
  {
    v7 = [(CTSignalStrengthMeasurements *)self rscp];
    [v3 appendFormat:@", rscp=%@", v7];
  }
  v8 = [(CTSignalStrengthMeasurements *)self ecn0];

  if (v8)
  {
    v9 = [(CTSignalStrengthMeasurements *)self ecn0];
    [v3 appendFormat:@", ecn0=%@", v9];
  }
  v10 = [(CTSignalStrengthMeasurements *)self rsrp];

  if (v10)
  {
    v11 = [(CTSignalStrengthMeasurements *)self rsrp];
    [v3 appendFormat:@", rsrp=%@", v11];
  }
  v12 = [(CTSignalStrengthMeasurements *)self rsrq];

  if (v12)
  {
    v13 = [(CTSignalStrengthMeasurements *)self rsrq];
    [v3 appendFormat:@", rsrq=%@", v13];
  }
  v14 = [(CTSignalStrengthMeasurements *)self snr];

  if (v14)
  {
    v15 = [(CTSignalStrengthMeasurements *)self snr];
    [v3 appendFormat:@", snr=%@", v15];
  }
  v16 = [(CTSignalStrengthMeasurements *)self ecio];

  if (v16)
  {
    v17 = [(CTSignalStrengthMeasurements *)self ecio];
    [v3 appendFormat:@", ecio=%@", v17];
  }
  v18 = [(CTSignalStrengthMeasurements *)self rxagc];

  if (v18)
  {
    v19 = [(CTSignalStrengthMeasurements *)self rxagc];
    [v3 appendFormat:@", rxagc=%@", v19];
  }
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(CTSignalStrengthMeasurements *)self rssi];
  v6 = (void *)[v5 copy];
  [v4 setRssi:v6];

  v7 = [(CTSignalStrengthMeasurements *)self rscp];
  v8 = (void *)[v7 copy];
  [v4 setRscp:v8];

  v9 = [(CTSignalStrengthMeasurements *)self ecn0];
  v10 = (void *)[v9 copy];
  [v4 setEcn0:v10];

  v11 = [(CTSignalStrengthMeasurements *)self rsrp];
  v12 = (void *)[v11 copy];
  [v4 setRsrp:v12];

  v13 = [(CTSignalStrengthMeasurements *)self rsrq];
  v14 = (void *)[v13 copy];
  [v4 setRsrq:v14];

  v15 = [(CTSignalStrengthMeasurements *)self snr];
  v16 = (void *)[v15 copy];
  [v4 setSnr:v16];

  v17 = [(CTSignalStrengthMeasurements *)self ecio];
  v18 = (void *)[v17 copy];
  [v4 setEcio:v18];

  v19 = [(CTSignalStrengthMeasurements *)self rxagc];
  v20 = (void *)[v19 copy];
  [v4 setRxagc:v20];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CTSignalStrengthMeasurements *)self rssi];
  [v4 encodeObject:v5 forKey:@"rssi"];

  v6 = [(CTSignalStrengthMeasurements *)self rscp];
  [v4 encodeObject:v6 forKey:@"rscp"];

  v7 = [(CTSignalStrengthMeasurements *)self ecn0];
  [v4 encodeObject:v7 forKey:@"ecn0"];

  v8 = [(CTSignalStrengthMeasurements *)self rsrp];
  [v4 encodeObject:v8 forKey:@"rsrp"];

  v9 = [(CTSignalStrengthMeasurements *)self rsrq];
  [v4 encodeObject:v9 forKey:@"rsrq"];

  v10 = [(CTSignalStrengthMeasurements *)self snr];
  [v4 encodeObject:v10 forKey:@"snr"];

  v11 = [(CTSignalStrengthMeasurements *)self ecio];
  [v4 encodeObject:v11 forKey:@"ecio"];

  id v12 = [(CTSignalStrengthMeasurements *)self rxagc];
  [v4 encodeObject:v12 forKey:@"rxagc"];
}

- (CTSignalStrengthMeasurements)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CTSignalStrengthMeasurements;
  v5 = [(CTSignalStrengthMeasurements *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rssi"];
    rssi = v5->_rssi;
    v5->_rssi = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rscp"];
    rscp = v5->_rscp;
    v5->_rscp = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ecn0"];
    ecn0 = v5->_ecn0;
    v5->_ecn0 = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rsrp"];
    rsrp = v5->_rsrp;
    v5->_rsrp = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rsrq"];
    rsrq = v5->_rsrq;
    v5->_rsrq = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snr"];
    snr = v5->_snr;
    v5->_snr = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ecio"];
    ecio = v5->_ecio;
    v5->_ecio = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rxagc"];
    rxagc = v5->_rxagc;
    v5->_rxagc = (NSNumber *)v20;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
}

- (NSNumber)rscp
{
  return self->_rscp;
}

- (void)setRscp:(id)a3
{
}

- (NSNumber)ecn0
{
  return self->_ecn0;
}

- (void)setEcn0:(id)a3
{
}

- (NSNumber)rsrp
{
  return self->_rsrp;
}

- (void)setRsrp:(id)a3
{
}

- (NSNumber)rsrq
{
  return self->_rsrq;
}

- (void)setRsrq:(id)a3
{
}

- (NSNumber)snr
{
  return self->_snr;
}

- (void)setSnr:(id)a3
{
}

- (NSNumber)ecio
{
  return self->_ecio;
}

- (void)setEcio:(id)a3
{
}

- (NSNumber)rxagc
{
  return self->_rxagc;
}

- (void)setRxagc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rxagc, 0);
  objc_storeStrong((id *)&self->_ecio, 0);
  objc_storeStrong((id *)&self->_snr, 0);
  objc_storeStrong((id *)&self->_rsrq, 0);
  objc_storeStrong((id *)&self->_rsrp, 0);
  objc_storeStrong((id *)&self->_ecn0, 0);
  objc_storeStrong((id *)&self->_rscp, 0);

  objc_storeStrong((id *)&self->_rssi, 0);
}

@end