@interface IDSFirewall
- (IDSFirewall)initWithService:(id)a3 queue:(id)a4;
- (NSSet)impactedServiceIdentifiers;
- (NSString)service;
- (OS_dispatch_queue)queue;
- (id)_removeInvalidEntries:(id)a3;
- (id)description;
- (void)addEntries:(id)a3 withCompletion:(id)a4;
- (void)currentDonatedEntries:(id)a3;
- (void)currentEntries:(id)a3;
- (void)donateEntries:(id)a3 withCompletion:(id)a4;
- (void)populateImpactedServices:(id)a3;
- (void)recentlyBlockedEntries:(id)a3;
- (void)removeAllDonatedEntries:(id)a3;
- (void)removeAllEntries:(id)a3;
- (void)removeDonatedEntries:(id)a3 withCompletion:(id)a4;
- (void)removeEntries:(id)a3 withCompletion:(id)a4;
- (void)replaceAllEntriesWithEntries:(id)a3 withCompletion:(id)a4;
- (void)replaceDonatedEntriesWithEntries:(id)a3 withCompletion:(id)a4;
- (void)replaceEntries:(id)a3 withCompletion:(id)a4;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
@end

@implementation IDSFirewall

- (IDSFirewall)initWithService:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSFirewall;
  v8 = [(IDSFirewall *)&v15 init];
  if (v8)
  {
    v9 = +[IDSInternalQueueController sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_191950DF4;
    v11[3] = &unk_1E5728DA8;
    v12 = v8;
    id v13 = v6;
    id v14 = v7;
    [v9 performBlock:v11 waitUntilDone:1];
  }
  return v8;
}

- (void)setQueue:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191950F7C;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7 waitUntilDone:1];
}

- (void)populateImpactedServices:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"IDSFirewall.m", 98, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  queue = self->_queue;
  id v7 = +[IDSLogging IDSService];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v8)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      v18 = (const char *)service;
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "IDSFirewall populateImpactedServices for service %@", buf, 0xCu);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1919511BC;
    v15[3] = &unk_1E5729AD8;
    v15[4] = self;
    id v16 = v5;
    v10 = (void *)MEMORY[0x192FE03B0](v15);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_191951308;
    v13[3] = &unk_1E5729FE8;
    v13[4] = self;
    id v14 = v10;
    id v11 = v10;
    +[IDSXPCDaemonController performDaemonControllerTask:v13];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[IDSFirewall populateImpactedServices:]";
      _os_log_impl(&dword_19190B000, v7, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
    }
  }
}

- (void)addEntries:(id)a3 withCompletion:(id)a4
{
}

- (void)donateEntries:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v9 = +[IDSLogging IDSService];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v24 = (const char *)service;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ donateEntries %@", buf, 0x16u);
    }

    v12 = [(IDSFirewall *)self _removeInvalidEntries:v6];

    if ([v12 count])
    {
      id v13 = self->_service;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_191951838;
      v17[3] = &unk_1E572A4B8;
      id v6 = v12;
      v18 = v6;
      uint64_t v19 = self;
      id v20 = v7;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1919519A4;
      v15[3] = &unk_1E57298A8;
      v15[4] = self;
      id v16 = v20;
      sub_191951750(v13, v17, v15);

      v9 = v18;
    }
    else
    {
      id v14 = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_19195173C;
      block[3] = &unk_1E5728FD8;
      v22 = v7;
      dispatch_async(v14, block);
      v9 = v22;
      id v6 = v12;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[IDSFirewall donateEntries:withCompletion:]";
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (void)removeDonatedEntries:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v9 = +[IDSLogging IDSService];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v24 = (const char *)service;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeDonatedEntries %@", buf, 0x16u);
    }

    v12 = [(IDSFirewall *)self _removeInvalidEntries:v6];

    if ([v12 count])
    {
      id v13 = self->_service;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_191951D1C;
      v17[3] = &unk_1E572A4B8;
      id v6 = v12;
      v18 = v6;
      uint64_t v19 = self;
      id v20 = v7;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_191951E88;
      v15[3] = &unk_1E57298A8;
      v15[4] = self;
      id v16 = v20;
      sub_191951750(v13, v17, v15);

      v9 = v18;
    }
    else
    {
      id v14 = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_191951D08;
      block[3] = &unk_1E5728FD8;
      v22 = v7;
      dispatch_async(v14, block);
      v9 = v22;
      id v6 = v12;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[IDSFirewall removeDonatedEntries:withCompletion:]";
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (void)removeEntries:(id)a3 withCompletion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v9 = +[IDSLogging IDSService];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v24 = (const char *)service;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeEntries %@", buf, 0x16u);
    }

    v12 = [(IDSFirewall *)self _removeInvalidEntries:v6];

    if ([v12 count])
    {
      id v13 = self->_service;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = sub_191952200;
      v17[3] = &unk_1E572A4B8;
      id v6 = v12;
      v18 = v6;
      uint64_t v19 = self;
      id v20 = v7;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_19195236C;
      v15[3] = &unk_1E57298A8;
      v15[4] = self;
      id v16 = v20;
      sub_191951750(v13, v17, v15);

      v9 = v18;
    }
    else
    {
      id v14 = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1919521EC;
      block[3] = &unk_1E5728FD8;
      v22 = v7;
      dispatch_async(v14, block);
      v9 = v22;
      id v6 = v12;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[IDSFirewall removeEntries:withCompletion:]";
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (void)replaceEntries:(id)a3 withCompletion:(id)a4
{
}

- (void)replaceDonatedEntriesWithEntries:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v9 = +[IDSLogging IDSService];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v21 = (const char *)service;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ replaceDonatedEntriesWithEntries %@", buf, 0x16u);
    }

    v12 = [(IDSFirewall *)self _removeInvalidEntries:v6];

    if ([v12 count])
    {
      id v13 = self->_service;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_191952678;
      v16[3] = &unk_1E572A4B8;
      id v6 = v12;
      id v17 = v6;
      v18 = self;
      id v19 = v7;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1919527E8;
      v14[3] = &unk_1E57298A8;
      v14[4] = self;
      id v15 = v19;
      sub_191951750(v13, v16, v14);
    }
    else
    {
      [(IDSFirewall *)self removeAllDonatedEntries:v7];
      id v6 = v12;
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[IDSFirewall replaceDonatedEntriesWithEntries:withCompletion:]";
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
    }
  }
}

- (void)replaceAllEntriesWithEntries:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v9 = +[IDSLogging IDSService];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v10)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412546;
      v21 = (const char *)service;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ replaceAllEntriesWithEntries %@", buf, 0x16u);
    }

    v12 = [(IDSFirewall *)self _removeInvalidEntries:v6];

    if ([v12 count])
    {
      id v13 = self->_service;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_191952AF0;
      v16[3] = &unk_1E572A4B8;
      id v6 = v12;
      id v17 = v6;
      v18 = self;
      id v19 = v7;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_191952C60;
      v14[3] = &unk_1E57298A8;
      v14[4] = self;
      id v15 = v19;
      sub_191951750(v13, v16, v14);
    }
    else
    {
      [(IDSFirewall *)self removeAllEntries:v7];
      id v6 = v12;
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[IDSFirewall replaceAllEntriesWithEntries:withCompletion:]";
      _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
    }
  }
}

- (void)currentDonatedEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  id v6 = +[IDSLogging IDSService];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      id v15 = (const char *)service;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall currentEntries for service %@", buf, 0xCu);
    }

    v9 = self->_service;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_191952FDC;
    v12[3] = &unk_1E572A508;
    v12[4] = self;
    id v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_191953164;
    v10[3] = &unk_1E572A4E0;
    v10[4] = self;
    id v11 = v13;
    sub_191952EF4(v9, v12, v10);

    id v6 = v13;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[IDSFirewall currentDonatedEntries:]";
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (void)currentEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  id v6 = +[IDSLogging IDSService];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      id v15 = (const char *)service;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall currentEntries for service %@", buf, 0xCu);
    }

    v9 = self->_service;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_191953424;
    v12[3] = &unk_1E572A508;
    v12[4] = self;
    id v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1919535AC;
    v10[3] = &unk_1E572A4E0;
    v10[4] = self;
    id v11 = v13;
    sub_191952EF4(v9, v12, v10);

    id v6 = v13;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[IDSFirewall currentEntries:]";
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (void)removeAllDonatedEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  id v6 = +[IDSLogging IDSService];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      id v15 = (const char *)service;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeAllDonatedEntries", buf, 0xCu);
    }

    v9 = self->_service;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19195386C;
    v12[3] = &unk_1E572A508;
    v12[4] = self;
    id v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1919539C8;
    v10[3] = &unk_1E57298A8;
    v10[4] = self;
    id v11 = v13;
    sub_191951750(v9, v12, v10);

    id v6 = v13;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[IDSFirewall removeAllDonatedEntries:]";
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (void)removeAllEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  id v6 = +[IDSLogging IDSService];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      id v15 = (const char *)service;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall update for service %@ removeAllEntries", buf, 0xCu);
    }

    v9 = self->_service;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_191953C5C;
    v12[3] = &unk_1E572A508;
    v12[4] = self;
    id v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_191953DB8;
    v10[3] = &unk_1E57298A8;
    v10[4] = self;
    id v11 = v13;
    sub_191951750(v9, v12, v10);

    id v6 = v13;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[IDSFirewall removeAllEntries:]";
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (void)recentlyBlockedEntries:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  queue = self->_queue;
  id v6 = +[IDSLogging IDSService];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (queue)
  {
    if (v7)
    {
      service = self->_service;
      *(_DWORD *)buf = 138412290;
      id v15 = (const char *)service;
      _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall recentlyBlockedEntries for service %@", buf, 0xCu);
    }

    v9 = self->_service;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_19195404C;
    v12[3] = &unk_1E572A508;
    v12[4] = self;
    id v13 = v4;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1919541D4;
    v10[3] = &unk_1E572A4E0;
    v10[4] = self;
    id v11 = v13;
    sub_191952EF4(v9, v12, v10);

    id v6 = v13;
  }
  else if (v7)
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[IDSFirewall recentlyBlockedEntries:]";
    _os_log_impl(&dword_19190B000, v6, OS_LOG_TYPE_DEFAULT, "IDSFirewall - assert valid queue failed in %s", buf, 0xCu);
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = [(IDSFirewall *)self service];
  id v5 = [(IDSFirewall *)self queue];
  id v6 = [(IDSFirewall *)self impactedServiceIdentifiers];
  BOOL v7 = [v3 stringWithFormat:@"<IDSFirewall %p>: Service %@ Queue %@ ImpactedServices %@", self, v4, v5, v6];

  return v7;
}

- (id)_removeInvalidEntries:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "uri", (void)v17);
        if (v11)
        {
          v12 = (void *)v11;
          id v13 = [v10 uri];
          id v14 = [v13 prefixedURI];

          if (v14) {
            [v4 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = (void *)[v4 copy];

  return v15;
}

- (NSSet)impactedServiceIdentifiers
{
  return self->_impactedServiceIdentifiers;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_impactedServiceIdentifiers, 0);
}

@end