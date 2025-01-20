@interface CalendarSeparationSharedAccount
- (CalendarSeparationSharedAccount)initWithSource:(id)a3 andDelegates:(id)a4;
- (EKSource)source;
- (NSArray)delegates;
- (id)displayDetail;
- (id)displayName;
- (int64_t)visibility;
- (void)setDelegates:(id)a3;
- (void)setSource:(id)a3;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation CalendarSeparationSharedAccount

- (CalendarSeparationSharedAccount)initWithSource:(id)a3 andDelegates:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CalendarSeparationSharedAccount;
  v9 = [(CalendarSeparationSharedAccount *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_source, a3);
    objc_storeStrong((id *)&v10->_delegates, a4);
    v11 = objc_opt_new();
    [(CalendarSeparationSharedResource *)v10 setCsParticipants:v11];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v16);
          v18 = [CalendarSeparationParticipant alloc];
          v19 = -[CalendarSeparationParticipant initWithGrantedDelegate:](v18, "initWithGrantedDelegate:", v17, (void)v22);
          v20 = [(CalendarSeparationSharedResource *)v10 csParticipants];
          [v20 addObject:v19];

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }
  }
  return v10;
}

- (id)displayName
{
  v2 = [(CalendarSeparationSharedAccount *)self source];
  v3 = [v2 title];

  return v3;
}

- (id)displayDetail
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Account has granted delegate access" value:&stru_8400 table:0];

  return v3;
}

- (int64_t)visibility
{
  return 1;
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 1;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_2EAC;
  v40 = sub_2EBC;
  id v41 = 0;
  long long v24 = self;
  id v7 = [(CalendarSeparationSharedAccount *)self source];

  if (v7)
  {
    id v8 = [(CalendarSeparationSharedAccount *)self source];
    long long v23 = [v8 eventStore];

    v9 = dispatch_group_create();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v10 = [(CalendarSeparationSharedAccount *)self delegates];
    id v11 = [v10 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v33;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v15 = [[CalendarSeparationParticipant alloc] initWithGrantedDelegate:v14];
          v16 = v15;
          if (!v6 || [(CalendarSeparationParticipant *)v15 matchesDSParticipation:v6])
          {
            dispatch_group_enter(v9);
            uint64_t v17 = [(CalendarSeparationSharedAccount *)v24 source];
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_2EC4;
            v28[3] = &unk_8240;
            v30 = v42;
            v31 = &v36;
            v29 = v9;
            [v23 updateGrantedDelegate:v14 action:1 source:v17 completion:v28];
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v11);
    }

    v18 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2F38;
    block[3] = &unk_8268;
    id v26 = v22;
    v27 = &v36;
    dispatch_group_notify(v9, v18, block);
  }
  else
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"Resource is missing Source";
    v19 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v20 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v19];
    v21 = (void *)v37[5];
    v37[5] = v20;

    (*((void (**)(id, uint64_t))v22 + 2))(v22, v37[5]);
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(v42, 8);
}

- (EKSource)source
{
  return (EKSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSource:(id)a3
{
}

- (NSArray)delegates
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end