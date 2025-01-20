@interface BDSDistributedPriceTrackingConfigNotification
+ (BOOL)supportsSecureCoding;
- (BDSDistributedPriceTrackingConfigNotification)initWithCoder:(id)a3;
- (BDSDistributedPriceTrackingConfigNotification)initWithTitle:(id)a3 subtitleSingle:(id)a4 bodySingleAudiobook:(id)a5 bodySingleBook:(id)a6 bodyMultiple:(id)a7;
- (BDSDistributedPriceTrackingConfigNotification)initWithTitleSingleAudiobook:(id)a3 titleSingleBook:(id)a4 titleMultiple:(id)a5 bodySingleAudiobook:(id)a6 bodySingleBook:(id)a7 bodyMultiple:(id)a8;
- (NSString)bodyMultiple;
- (NSString)bodySingleAudiobook;
- (NSString)bodySingleBook;
- (NSString)subtitleSingle;
- (NSString)title;
- (NSString)titleMultiple;
- (NSString)titleSingleAudiobook;
- (NSString)titleSingleBook;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BDSDistributedPriceTrackingConfigNotification

- (BDSDistributedPriceTrackingConfigNotification)initWithTitleSingleAudiobook:(id)a3 titleSingleBook:(id)a4 titleMultiple:(id)a5 bodySingleAudiobook:(id)a6 bodySingleBook:(id)a7 bodyMultiple:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v40.receiver = self;
  v40.super_class = (Class)BDSDistributedPriceTrackingConfigNotification;
  v20 = [(BDSDistributedPriceTrackingConfigNotification *)&v40 init];
  if (v20)
  {
    v21 = (__CFString *)[v14 copy];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = &stru_10026BED0;
    }
    objc_storeStrong((id *)&v20->_titleSingleAudiobook, v23);

    v24 = (__CFString *)[v15 copy];
    v25 = v24;
    if (v24) {
      v26 = v24;
    }
    else {
      v26 = &stru_10026BED0;
    }
    objc_storeStrong((id *)&v20->_titleSingleBook, v26);

    v27 = (__CFString *)[v16 copy];
    v28 = v27;
    if (v27) {
      v29 = v27;
    }
    else {
      v29 = &stru_10026BED0;
    }
    objc_storeStrong((id *)&v20->_titleMultiple, v29);

    v30 = (__CFString *)[v17 copy];
    v31 = v30;
    if (v30) {
      v32 = v30;
    }
    else {
      v32 = &stru_10026BED0;
    }
    objc_storeStrong((id *)&v20->_bodySingleAudiobook, v32);

    v33 = (__CFString *)[v18 copy];
    v34 = v33;
    if (v33) {
      v35 = v33;
    }
    else {
      v35 = &stru_10026BED0;
    }
    objc_storeStrong((id *)&v20->_bodySingleBook, v35);

    v36 = (__CFString *)[v19 copy];
    v37 = v36;
    if (v36) {
      v38 = v36;
    }
    else {
      v38 = &stru_10026BED0;
    }
    objc_storeStrong((id *)&v20->_bodyMultiple, v38);
  }
  return v20;
}

- (NSString)title
{
  return (NSString *)&stru_10026BED0;
}

- (NSString)subtitleSingle
{
  return (NSString *)&stru_10026BED0;
}

- (BDSDistributedPriceTrackingConfigNotification)initWithTitle:(id)a3 subtitleSingle:(id)a4 bodySingleAudiobook:(id)a5 bodySingleBook:(id)a6 bodyMultiple:(id)a7
{
  return [(BDSDistributedPriceTrackingConfigNotification *)self initWithTitleSingleAudiobook:&stru_10026BED0 titleSingleBook:&stru_10026BED0 titleMultiple:&stru_10026BED0 bodySingleAudiobook:&stru_10026BED0 bodySingleBook:&stru_10026BED0 bodyMultiple:&stru_10026BED0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BDSDistributedPriceTrackingConfigNotification *)self titleSingleAudiobook];
  [v4 encodeObject:v5 forKey:@"titleSingleAudiobook"];

  v6 = [(BDSDistributedPriceTrackingConfigNotification *)self titleSingleBook];
  [v4 encodeObject:v6 forKey:@"titleSingleBook"];

  v7 = [(BDSDistributedPriceTrackingConfigNotification *)self titleMultiple];
  [v4 encodeObject:v7 forKey:@"titleMultiple"];

  v8 = [(BDSDistributedPriceTrackingConfigNotification *)self bodySingleAudiobook];
  [v4 encodeObject:v8 forKey:@"bodySingleAudiobook"];

  v9 = [(BDSDistributedPriceTrackingConfigNotification *)self bodySingleBook];
  [v4 encodeObject:v9 forKey:@"bodySingleBook"];

  id v10 = [(BDSDistributedPriceTrackingConfigNotification *)self bodyMultiple];
  [v4 encodeObject:v10 forKey:@"bodyMultiple"];
}

- (BDSDistributedPriceTrackingConfigNotification)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleSingleAudiobook"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleSingleBook"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleMultiple"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodySingleAudiobook"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodySingleBook"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyMultiple"];

  v11 = [(BDSDistributedPriceTrackingConfigNotification *)self initWithTitleSingleAudiobook:v5 titleSingleBook:v6 titleMultiple:v7 bodySingleAudiobook:v8 bodySingleBook:v9 bodyMultiple:v10];
  return v11;
}

- (NSString)titleSingleAudiobook
{
  return self->_titleSingleAudiobook;
}

- (NSString)titleSingleBook
{
  return self->_titleSingleBook;
}

- (NSString)titleMultiple
{
  return self->_titleMultiple;
}

- (NSString)bodySingleAudiobook
{
  return self->_bodySingleAudiobook;
}

- (NSString)bodySingleBook
{
  return self->_bodySingleBook;
}

- (NSString)bodyMultiple
{
  return self->_bodyMultiple;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyMultiple, 0);
  objc_storeStrong((id *)&self->_bodySingleBook, 0);
  objc_storeStrong((id *)&self->_bodySingleAudiobook, 0);
  objc_storeStrong((id *)&self->_titleMultiple, 0);
  objc_storeStrong((id *)&self->_titleSingleBook, 0);
  objc_storeStrong((id *)&self->_titleSingleAudiobook, 0);
}

@end