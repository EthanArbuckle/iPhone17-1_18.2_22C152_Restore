@interface AMSFairPlayDeviceIdentitySession
+ (BOOL)reset:(id *)a3;
+ (id)errorForFPDIStatus:(int)a3 stage:(unint64_t)a4;
+ (id)stringForStage:(unint64_t)a3;
- (AMSFairPlayDeviceIdentitySession)initWithExistingSession:(unint64_t)a3 creationDate:(id)a4 error:(id *)a5;
- (AMSFairPlayDeviceIdentitySession)initWithLevel:(int64_t)a3 error:(id *)a4;
- (BOOL)setupSessionWithInitializationResponseData:(id)a3 error:(id *)a4;
- (NSDate)creationDate;
- (id)creationDataWithError:(id *)a3;
- (id)initializationDataWithCreationResponseData:(id)a3 error:(id *)a4;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (unint64_t)fpdiSessionId;
- (void)dealloc;
@end

@implementation AMSFairPlayDeviceIdentitySession

+ (BOOL)reset:(id *)a3
{
  plsicnq9qs(0);
  int v5 = v4;
  if (a3)
  {
    *a3 = +[AMSFairPlayDeviceIdentitySession errorForFPDIStatus:v4 stage:0];
  }
  return v5 == 0;
}

- (AMSFairPlayDeviceIdentitySession)initWithExistingSession:(unint64_t)a3 creationDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)AMSFairPlayDeviceIdentitySession;
    v9 = [(AMSFairPlayDeviceIdentitySession *)&v13 init];
    v10 = v9;
    if (v9)
    {
      v9->_fpdiSession = (void *)a3;
      objc_storeStrong((id *)&v9->_creationDate, a4);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)fpdiSessionId
{
  return (unint64_t)self->_fpdiSession;
}

- (AMSFairPlayDeviceIdentitySession)initWithLevel:(int64_t)a3 error:(id *)a4
{
  v15.receiver = self;
  v15.super_class = (Class)AMSFairPlayDeviceIdentitySession;
  v6 = [(AMSFairPlayDeviceIdentitySession *)&v15 init];
  id v8 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  p_attributes = (uint64_t *)&v6->_attributes;
  uint64_t v7 = jsf09djfs0df((uint64_t)&v6->_attributes);
  if (v7) {
    goto LABEL_9;
  }
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_8;
    }
    int v10 = 1379922824;
  }
  else
  {
    int v10 = 1011340354;
  }
  uint64_t v7 = RXm4IJLE3xR(*p_attributes, v10);
  if (v7) {
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v7 = koqa938msd8(*p_attributes, 0);
  if (!v7)
  {
LABEL_11:
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v7);
    creationDate = v8->_creationDate;
    v8->_creationDate = (NSDate *)v12;

    v11 = v8;
    goto LABEL_13;
  }
LABEL_9:
  if (a4)
  {
    +[AMSFairPlayDeviceIdentitySession errorForFPDIStatus:v7 stage:0];
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (void)dealloc
{
  fpdiSession = self->_fpdiSession;
  p_fpdiSession = &self->_fpdiSession;
  if (fpdiSession) {
    sldksmfm1n((uint64_t)p_fpdiSession);
  }
  if (self->_attributes) {
    fdf324tt5((uint64_t)&self->_attributes);
  }
  v5.receiver = self;
  v5.super_class = (Class)AMSFairPlayDeviceIdentitySession;
  [(AMSFairPlayDeviceIdentitySession *)&v5 dealloc];
}

- (id)creationDataWithError:(id *)a3
{
  uint64_t v9 = 0;
  unsigned int v8 = 0;
  d2234hmbdf((uint64_t)&self->_fpdiSession, (uint64_t)self->_attributes, (uint64_t)&v9, (uint64_t)&v8);
  if (v4)
  {
    if (a3)
    {
      id v5 = +[AMSFairPlayDeviceIdentitySession errorForFPDIStatus:v4 stage:1];
      v6 = 0;
      *a3 = v5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ams_createDataWithFPDIResult:length:", v9, v8);
  }
  return v6;
}

- (id)initializationDataWithCreationResponseData:(id)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  unsigned int v13 = 0;
  fpdiSession = self->_fpdiSession;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  g9000sds9((uint64_t)fpdiSession, v7, v8, (uint64_t)&v14, (uint64_t)&v13);
  if (v9)
  {
    if (a4)
    {
      id v10 = +[AMSFairPlayDeviceIdentitySession errorForFPDIStatus:v9 stage:2];
      v11 = 0;
      *a4 = v10;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ams_createDataWithFPDIResult:length:", v14, v13);
  }
  return v11;
}

- (BOOL)setupSessionWithInitializationResponseData:(id)a3 error:(id *)a4
{
  fpdiSession = self->_fpdiSession;
  id v6 = a3;
  [v6 bytes];
  [v6 length];

  fsmklk123((uint64_t)fpdiSession);
  int v8 = v7;
  if (a4 && v7)
  {
    *a4 = +[AMSFairPlayDeviceIdentitySession errorForFPDIStatus:v7 stage:3];
  }
  return v8 == 0;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  uint64_t v14 = 0;
  unsigned int v13 = 0;
  fpdiSession = self->_fpdiSession;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  sdfspp103e9rf((uint64_t)fpdiSession, v7, v8, (uint64_t)&v14, (uint64_t)&v13);
  if (v9)
  {
    if (a4)
    {
      id v10 = +[AMSFairPlayDeviceIdentitySession errorForFPDIStatus:v9 stage:4];
      v11 = 0;
      *a4 = v10;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ams_createDataWithFPDIResult:length:", v14, v13);
  }
  return v11;
}

+ (id)errorForFPDIStatus:(int)a3 stage:(unint64_t)a4
{
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AMSErrorDomain" code:a3 userInfo:0];
  uint64_t v7 = +[AMSFairPlayDeviceIdentitySession stringForStage:a4];
  if ((a3 + 44684) > 0x1E) {
    goto LABEL_6;
  }
  if (((1 << (a3 - 116)) & 0x40010003) != 0)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Invalid session - %@", v7];
    uint64_t v9 = 901;
    goto LABEL_10;
  }
  if (a3 != -44663)
  {
LABEL_6:
    if (a4 == 4) {
      uint64_t v10 = 902;
    }
    else {
      uint64_t v10 = 900;
    }
    uint64_t v8 = [NSString stringWithFormat:@"Error in %@", v7];
    uint64_t v9 = v10;
    goto LABEL_10;
  }
  uint64_t v8 = [NSString stringWithFormat:@"Invalid session - %@", v7];
  uint64_t v9 = 905;
LABEL_10:
  v11 = AMSError(v9, @"FPDI Error", v8, v6);

  return v11;
}

+ (id)stringForStage:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"Attribute init";
  }
  else {
    return off_1E55A2878[a3 - 1];
  }
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
}

@end