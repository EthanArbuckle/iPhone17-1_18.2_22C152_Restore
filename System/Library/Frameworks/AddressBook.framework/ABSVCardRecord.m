@interface ABSVCardRecord
- (ABSVCardRecord)initWithRecord:(void *)a3;
- (ABSVCardRecord)initWithVCardRepresentation:(id)a3;
- (void)dealloc;
- (void)record;
@end

@implementation ABSVCardRecord

- (ABSVCardRecord)initWithVCardRepresentation:(id)a3
{
  id v10 = 0;
  v4 = [MEMORY[0x263EFEA70] contactsWithData:a3 error:&v10];
  id v5 = v10;
  if (!v4)
  {
    v6 = +[ABSLog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ABSVCardRecord initWithVCardRepresentation:]((uint64_t)v5, v6);
    }
    goto LABEL_8;
  }
  if ([v4 count] != 1)
  {
    v6 = +[ABSLog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ABSVCardRecord initWithVCardRepresentation:](v6);
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = [v4 firstObject];
  v7 = +[ABSPublicABCNCompatibility publicABPersonFromContact:v6 contactStore:0 publicAddressBook:0];
LABEL_9:

  v8 = [(ABSVCardRecord *)self initWithRecord:v7];
  return v8;
}

- (ABSVCardRecord)initWithRecord:(void *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ABSVCardRecord;
  v4 = [(ABSVCardRecord *)&v8 init];
  if (v4)
  {
    if (a3) {
      id v5 = (void *)CFRetain(a3);
    }
    else {
      id v5 = 0;
    }
    v4->_record = v5;
    v6 = v4;
  }

  return v4;
}

- (void)dealloc
{
  record = self->_record;
  if (record) {
    CFRelease(record);
  }
  v4.receiver = self;
  v4.super_class = (Class)ABSVCardRecord;
  [(ABSVCardRecord *)&v4 dealloc];
}

- (void)record
{
  return self->_record;
}

- (void)initWithVCardRepresentation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_214A03000, a2, OS_LOG_TYPE_ERROR, "Error parsing vcard: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithVCardRepresentation:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214A03000, log, OS_LOG_TYPE_ERROR, "Expected a single contact in the vcard, returning nothing", v1, 2u);
}

@end