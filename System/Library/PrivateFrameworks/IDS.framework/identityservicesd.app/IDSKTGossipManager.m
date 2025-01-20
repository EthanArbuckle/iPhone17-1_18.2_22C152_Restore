@interface IDSKTGossipManager
+ (id)sharedInstance;
- (BOOL)canGossipOnService:(id)a3;
- (IDSKTGossipManager)init;
- (IDSKTGossipManager)initWithGossipPolicy:(id)a3 transparencyVerifier:(id)a4 gossipEnabledServices:(id)a5;
- (IDSKTGossipPolicy)gossipPolicy;
- (IDSKeyTransparencyVerifier)transparencyVerifier;
- (NSSet)gossipEnabledServiceIdentifiers;
- (id)gossipSTHPayloadForDestinations:(id)a3 forServiceIdentifier:(id)a4 fromID:(id)a5;
- (id)transparencyVerifierSharedInstance;
- (unsigned)firstGossipChanceFromBag;
- (unsigned)maxRecipientMemoryFromBag;
- (unsigned)subsequentGossipChanceFromBag;
- (void)setGossipPolicy:(id)a3;
- (void)sthReceivedFromGossipReceipient:(id)a3;
@end

@implementation IDSKTGossipManager

+ (id)sharedInstance
{
  if (qword_100A4A6C8 != -1) {
    dispatch_once(&qword_100A4A6C8, &stru_100982930);
  }
  v2 = (void *)qword_100A4A6D0;

  return v2;
}

- (id)transparencyVerifierSharedInstance
{
  return +[IDSKeyTransparencyVerifier sharedInstance];
}

- (IDSKTGossipManager)init
{
  v3 = objc_alloc_init(IDSKTGossipPolicySpecification);
  [(IDSKTGossipPolicySpecification *)v3 setFirstGossipChance:(char)[(IDSKTGossipManager *)self firstGossipChanceFromBag]];
  [(IDSKTGossipPolicySpecification *)v3 setSubsequentGossipChance:(char)[(IDSKTGossipManager *)self subsequentGossipChanceFromBag]];
  [(IDSKTGossipPolicySpecification *)v3 setMaxRecipientMemory:(char)[(IDSKTGossipManager *)self maxRecipientMemoryFromBag]];
  v4 = [[IDSKTGossipPolicy alloc] initWithGossipSpecification:v3];
  v5 = [(IDSKTGossipManager *)self transparencyVerifierSharedInstance];
  v6 = +[NSSet setWithArray:&off_1009D2B90];
  v7 = [(IDSKTGossipManager *)self initWithGossipPolicy:v4 transparencyVerifier:v5 gossipEnabledServices:v6];

  return v7;
}

- (IDSKTGossipManager)initWithGossipPolicy:(id)a3 transparencyVerifier:(id)a4 gossipEnabledServices:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSKTGossipManager;
  v12 = [(IDSKTGossipManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_gossipPolicy, a3);
    objc_storeStrong((id *)&v13->_transparencyVerifier, a4);
    objc_storeStrong((id *)&v13->_gossipEnabledServiceIdentifiers, a5);
  }

  return v13;
}

- (BOOL)canGossipOnService:(id)a3
{
  return [(NSSet *)self->_gossipEnabledServiceIdentifiers containsObject:a3];
}

- (id)gossipSTHPayloadForDestinations:(id)a3 forServiceIdentifier:(id)a4 fromID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IDSKTGossipManager *)self canGossipOnService:v9])
  {
    id v11 = objc_alloc((Class)IDSURI);
    v12 = [v10 _stripPotentialTokenURIWithToken:0];
    v13 = [v11 initWithPrefixedURI:v12];

    id v39 = v8;
    v14 = [v8 destinationURIs];
    objc_super v15 = objc_msgSend(v14, "__imSetByApplyingBlock:", &stru_100982950);

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v46;
LABEL_4:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(NSObject **)(*((void *)&v45 + 1) + 8 * v20);
        if (![(IDSKTGossipPolicy *)self->_gossipPolicy havePreviouslyGossipedToURI:v21]&& v21 != v13)
        {
          break;
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v16 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v18) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      v23 = v21;

      if (v23) {
        goto LABEL_17;
      }
    }
    else
    {
LABEL_11:
    }
    uint32_t v24 = [v16 count];
    v25 = [v16 allObjects];
    v23 = [v25 objectAtIndexedSubscript:arc4random_uniform(v24)];

LABEL_17:
    if (v23 == v13)
    {
      v26 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "Trying to gossip to own device. Will not gossip.";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v30, buf, 2u);
      }
    }
    else
    {
      if ([(IDSKTGossipPolicy *)self->_gossipPolicy shouldGossipToURI:v23])
      {
        id v44 = 0;
        v38 = +[TransparencyGossip retrieveCurrentVerifiedTLTSTH:&v44];
        v26 = v44;
        v27 = +[IDSFoundationLog KeyTransparency];
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          id v8 = v39;
          if (v28)
          {
            *(_DWORD *)buf = 138412290;
            v52 = v26;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Error retrieving STH from transparencyd: %@", buf, 0xCu);
          }

          id v22 = 0;
          v29 = v38;
        }
        else
        {
          id v37 = v10;
          if (v28)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Successfully retrieved STH from transparencyd, will gossip.", buf, 2u);
          }

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v31 = v16;
          id v32 = [v31 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v41;
            do
            {
              for (i = 0; i != v33; i = (char *)i + 1)
              {
                if (*(void *)v41 != v34) {
                  objc_enumerationMutation(v31);
                }
                [(IDSKTGossipPolicy *)self->_gossipPolicy markGossipForURI:*(void *)(*((void *)&v40 + 1) + 8 * i)];
              }
              id v33 = [v31 countByEnumeratingWithState:&v40 objects:v49 count:16];
            }
            while (v33);
          }

          v29 = v38;
          id v22 = v38;
          id v8 = v39;
          id v10 = v37;
        }

        goto LABEL_40;
      }
      v26 = +[IDSFoundationLog KeyTransparency];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "Didn't pass dice roll, will not gossip";
        goto LABEL_27;
      }
    }
    id v22 = 0;
    id v8 = v39;
LABEL_40:

    goto LABEL_41;
  }
  v13 = +[IDSFoundationLog KeyTransparency];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Gossip is not enabled for service: %@", buf, 0xCu);
  }
  id v22 = 0;
LABEL_41:

  return v22;
}

- (void)sthReceivedFromGossipReceipient:(id)a3
{
  id v3 = a3;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117FDC;
  block[3] = &unk_10097E4D0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (unsigned)firstGossipChanceFromBag
{
  if (+[IMUserDefaults keyTransparencyFirstGossipChance] >= 1&& CUTIsInternalInstall())
  {
    return +[IMUserDefaults keyTransparencyFirstGossipChance];
  }
  id v3 = +[IDSServerBag sharedInstanceForBagType:0];
  v4 = [v3 objectForKey:&stru_10099BE78];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v2 = [v4 unsignedIntValue];
  }
  else {
    unsigned __int8 v2 = 20;
  }

  return v2;
}

- (unsigned)subsequentGossipChanceFromBag
{
  if (+[IMUserDefaults keyTransparencySubsequentGossipChance] >= 1&& CUTIsInternalInstall())
  {
    return +[IMUserDefaults keyTransparencySubsequentGossipChance];
  }
  id v3 = +[IDSServerBag sharedInstanceForBagType:0];
  v4 = [v3 objectForKey:&stru_10099BE78];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v2 = [v4 unsignedIntValue];
  }
  else {
    unsigned __int8 v2 = 2;
  }

  return v2;
}

- (unsigned)maxRecipientMemoryFromBag
{
  unsigned __int8 v2 = +[IDSServerBag sharedInstanceForBagType:0];
  id v3 = [v2 objectForKey:&stru_10099BE78];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned __int8 v4 = 100;
  }

  return v4;
}

- (IDSKTGossipPolicy)gossipPolicy
{
  return self->_gossipPolicy;
}

- (void)setGossipPolicy:(id)a3
{
}

- (IDSKeyTransparencyVerifier)transparencyVerifier
{
  return self->_transparencyVerifier;
}

- (NSSet)gossipEnabledServiceIdentifiers
{
  return self->_gossipEnabledServiceIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gossipEnabledServiceIdentifiers, 0);
  objc_storeStrong((id *)&self->_transparencyVerifier, 0);

  objc_storeStrong((id *)&self->_gossipPolicy, 0);
}

@end