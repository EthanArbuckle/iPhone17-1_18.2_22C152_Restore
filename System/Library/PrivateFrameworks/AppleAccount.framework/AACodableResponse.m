@interface AACodableResponse
+ (BOOL)supportsSecureCoding;
- (AACodableResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AACodableResponse

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  v4 = [(AAResponse *)self httpResponse];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DB0];
    v6 = [(AAResponse *)self httpResponse];
    v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

    if (v7) {
      [v13 encodeObject:v7 forKey:@"_httpResponse"];
    }
  }
  v8 = [(AAResponse *)self data];

  if (v8)
  {
    v9 = [(AAResponse *)self data];
    [v13 encodeObject:v9 forKey:@"_data"];
  }
  v10 = [(AAResponse *)self mediaType];

  v11 = v13;
  if (v10)
  {
    v12 = [(AAResponse *)self mediaType];
    [v13 encodeObject:v12 forKey:@"_mediaType"];

    v11 = v13;
  }
}

- (AACodableResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_mediaType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_data"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_httpResponse"];
  if (!v7)
  {
    v8 = 0;
LABEL_11:
    v12 = objc_msgSend(MEMORY[0x1E4F28C58], "aa_errorWithCode:", 0);
    [v4 failWithError:v12];

    v11 = 0;
    goto LABEL_12;
  }
  v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];
  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v5 == 0) {
    goto LABEL_11;
  }
  self = [(AAResponse *)self initWithHTTPResponse:v8 data:v6 mediaType:v5];
  v11 = self;
LABEL_12:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end