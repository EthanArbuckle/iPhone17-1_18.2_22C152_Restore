@interface BMMediaUsageEvent
- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 timestamp:(id)a7;
- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 usageTrusted:(BOOL)a7 timestamp:(id)a8;
- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 usageTrusted:(BOOL)a7 timestamp:(id)a8 safariProfileID:(id)a9;
- (BOOL)isUsageTrusted;
- (BOOL)isValidWithContext:(id)a3 error:(id *)a4;
- (NSString)description;
- (NSString)safariProfileID;
- (NSURL)URL;
- (NSURL)mediaURL;
- (void)setMediaURL:(id)a3;
- (void)setSafariProfileID:(id)a3;
- (void)setURL:(id)a3;
- (void)setUsageTrusted:(BOOL)a3;
@end

@implementation BMMediaUsageEvent

- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 timestamp:(id)a7
{
  return [(BMMediaUsageEvent *)self initWithBegin:a3 bundleID:a4 URL:a5 mediaURL:a6 usageTrusted:0 timestamp:a7];
}

- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 usageTrusted:(BOOL)a7 timestamp:(id)a8
{
  return [(BMMediaUsageEvent *)self initWithBegin:a3 bundleID:a4 URL:a5 mediaURL:a6 usageTrusted:a7 timestamp:a8 safariProfileID:0];
}

- (BMMediaUsageEvent)initWithBegin:(BOOL)a3 bundleID:(id)a4 URL:(id)a5 mediaURL:(id)a6 usageTrusted:(BOOL)a7 timestamp:(id)a8 safariProfileID:(id)a9
{
  BOOL v10 = a7;
  BOOL v13 = a3;
  v39[3] = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v38.receiver = self;
  v38.super_class = (Class)BMMediaUsageEvent;
  v20 = [(BMEventBase *)&v38 init];
  if (v20)
  {
    v21 = objc_alloc_init(BMEventTimeElapsingImplementor);
    v39[0] = v21;
    v37 = v19;
    id v22 = v18;
    id v23 = v17;
    BOOL v24 = v13;
    v25 = v16;
    id v26 = v15;
    v27 = objc_alloc_init(BMEventBinarySteppingImplementor);
    v39[1] = v27;
    v28 = objc_alloc_init(BMEventAppAssociatingImplementor);
    v39[2] = v28;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
    v29 = BOOL v36 = v10;
    [(BMEventBase *)v20 set_validators:v29];

    id v15 = v26;
    id v16 = v25;

    BOOL v30 = v24;
    id v17 = v23;
    id v18 = v22;
    id v19 = v37;
    [(BMMediaUsageEvent *)v20 setStarting:v30];
    v31 = (void *)[v15 copy];
    [(BMMediaUsageEvent *)v20 setBundleID:v31];

    v32 = (void *)[v25 copy];
    [(BMMediaUsageEvent *)v20 setURL:v32];

    v33 = (void *)[v17 copy];
    [(BMMediaUsageEvent *)v20 setMediaURL:v33];

    [(BMMediaUsageEvent *)v20 setUsageTrusted:v36];
    [v18 timeIntervalSinceReferenceDate];
    -[BMMediaUsageEvent setAbsoluteTimestamp:](v20, "setAbsoluteTimestamp:");
    v34 = (void *)[v37 copy];
    [(BMMediaUsageEvent *)v20 setSafariProfileID:v34];
  }
  return v20;
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BMMediaUsageEvent;
  return [(BMEventBase *)&v5 isValidWithContext:a3 error:a4];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  objc_super v5 = [(BMMediaUsageEvent *)self dateInterval];
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaUsageEvent isStarting](self, "isStarting"));
  v7 = [(BMMediaUsageEvent *)self bundleID];
  v8 = [(BMMediaUsageEvent *)self URL];
  v9 = [(BMMediaUsageEvent *)self mediaURL];
  BOOL v10 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMediaUsageEvent isUsageTrusted](self, "isUsageTrusted"));
  v11 = [v3 stringWithFormat:@"<%@ %p> interval: %@, launch: %@, bundleID: %@, URL: %@, mediaURL: %@ isUsageTrusted: %@", v4, self, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSURL)mediaURL
{
  return self->_mediaURL;
}

- (void)setMediaURL:(id)a3
{
}

- (BOOL)isUsageTrusted
{
  return self->_usageTrusted;
}

- (void)setUsageTrusted:(BOOL)a3
{
  self->_usageTrusted = a3;
}

- (NSString)safariProfileID
{
  return self->_safariProfileID;
}

- (void)setSafariProfileID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safariProfileID, 0);
  objc_storeStrong((id *)&self->_mediaURL, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end