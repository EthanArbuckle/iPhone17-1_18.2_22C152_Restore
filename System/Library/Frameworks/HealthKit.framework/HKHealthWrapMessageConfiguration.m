@interface HKHealthWrapMessageConfiguration
- (BOOL)disableCompression;
- (HKHealthWrapMessageConfiguration)initWithChannel:(id)a3 payloadType:(id)a4 certificate:(__SecCertificate *)a5;
- (HKHealthWrapMessageConfiguration)initWithSubjectUUID:(id)a3 studyUUID:(id)a4 channel:(id)a5 payloadType:(id)a6 certificate:(__SecCertificate *)a7;
- (NSData)applicationData;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)keyValuePairs;
- (NSString)channel;
- (NSString)payloadIdentifier;
- (NSString)payloadType;
- (NSUUID)studyUUID;
- (NSUUID)subjectUUID;
- (__SecCertificate)certificate;
- (void)dealloc;
- (void)setApplicationData:(id)a3;
- (void)setDisableCompression:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setKeyValuePairs:(id)a3;
- (void)setPayloadIdentifier:(id)a3;
- (void)setPayloadType:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation HKHealthWrapMessageConfiguration

- (HKHealthWrapMessageConfiguration)initWithChannel:(id)a3 payloadType:(id)a4 certificate:(__SecCertificate *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HKHealthWrapMessage.m", 41, @"Invalid parameter not satisfying: %@", @"payloadType != nil" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HKHealthWrapMessage.m", 40, @"Invalid parameter not satisfying: %@", @"channel != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_9:
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HKHealthWrapMessage.m", 42, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)HKHealthWrapMessageConfiguration;
  v12 = [(HKHealthWrapMessageConfiguration *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    channel = v12->_channel;
    v12->_channel = (NSString *)v13;

    uint64_t v15 = [v11 copy];
    payloadType = v12->_payloadType;
    v12->_payloadType = (NSString *)v15;

    CFRetain(a5);
    v12->_certificate = a5;
  }

  return v12;
}

- (HKHealthWrapMessageConfiguration)initWithSubjectUUID:(id)a3 studyUUID:(id)a4 channel:(id)a5 payloadType:(id)a6 certificate:(__SecCertificate *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKHealthWrapMessage.m", 57, @"Invalid parameter not satisfying: %@", @"subjectUUID != nil" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"HKHealthWrapMessage.m", 58, @"Invalid parameter not satisfying: %@", @"studyUUID != nil" object file lineNumber description];

LABEL_3:
  v17 = [(HKHealthWrapMessageConfiguration *)self initWithChannel:v15 payloadType:v16 certificate:a7];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    subjectUUID = v17->_subjectUUID;
    v17->_subjectUUID = (NSUUID *)v18;

    uint64_t v20 = [v14 copy];
    studyUUID = v17->_studyUUID;
    v17->_studyUUID = (NSUUID *)v20;
  }
  return v17;
}

- (void)dealloc
{
  certificate = self->_certificate;
  if (certificate) {
    CFRelease(certificate);
  }
  v4.receiver = self;
  v4.super_class = (Class)HKHealthWrapMessageConfiguration;
  [(HKHealthWrapMessageConfiguration *)&v4 dealloc];
}

- (NSUUID)subjectUUID
{
  return self->_subjectUUID;
}

- (NSUUID)studyUUID
{
  return self->_studyUUID;
}

- (NSString)channel
{
  return self->_channel;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
}

- (NSDictionary)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
}

- (BOOL)disableCompression
{
  return self->_disableCompression;
}

- (void)setDisableCompression:(BOOL)a3
{
  self->_disableCompression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);

  objc_storeStrong((id *)&self->_subjectUUID, 0);
}

@end