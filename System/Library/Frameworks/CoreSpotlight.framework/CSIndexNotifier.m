@interface CSIndexNotifier
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
- (BOOL)shouldHandleJournalItem:(id)a3;
- (BOOL)supportsCSIndexType:(int)a3;
- (id)description;
- (id)excludeBundleIDs;
- (id)excludeContentTypes;
- (id)includeBundleIDs;
- (id)includeContentTypes;
- (id)optionalAttribures;
- (id)requiredAttributes;
- (id)taskName;
- (int)eventType;
- (unint64_t)eventFlags;
@end

@implementation CSIndexNotifier

- (BOOL)isAcceptingJournals
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CSIndexNotifier *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (id)taskName
{
  return @"indexNotify";
}

- (unint64_t)eventFlags
{
  return 4;
}

- (int)eventType
{
  return 4;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return 1;
}

- (id)includeBundleIDs
{
  return 0;
}

- (id)excludeBundleIDs
{
  return 0;
}

- (id)includeContentTypes
{
  return 0;
}

- (id)excludeContentTypes
{
  return 0;
}

- (id)requiredAttributes
{
  return 0;
}

- (id)optionalAttribures
{
  return 0;
}

- (BOOL)shouldHandleJournalItem:(id)a3
{
  return 1;
}

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  v7 = (unsigned int *)a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[MADService service];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 1;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_100012734;
  v43[4] = sub_1000125B8;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_100012734;
  v41[4] = sub_1000125B8;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_100012734;
  v39[4] = sub_1000125B8;
  id v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_100012734;
  v37[4] = sub_1000125B8;
  id v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_100012734;
  v35 = sub_1000125B8;
  id v36 = 0;
  v11 = +[NSString stringWithUTF8String:sub_10001E910((uint64_t)v7)];
  v12 = sub_1000592B4(v7);
  v13 = +[NSString stringWithString:v12];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10009EF2C;
  v20[3] = &unk_1000DD128;
  v25 = v43;
  v26 = &v31;
  v27 = v41;
  id v14 = v13;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  v28 = v45;
  v29 = v37;
  v30 = v39;
  id v16 = v10;
  id v23 = v16;
  id v17 = v9;
  id v24 = v17;
  sub_100012034((uint64_t)v7, v20);
  v18 = v32[5];
  if (v18) {
    dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);

  return 0;
}

@end