@interface IDSFirewallEndpointDonationComponent
- (BOOL)isCommandExcluded:(id)a3 forService:(id)a4;
- (IDSDServiceController)serviceController;
- (IDSFirewallEndpointDonationComponent)initWithServiceController:(id)a3 firewallStore:(id)a4;
- (IDSFirewallStore)firewallStore;
- (id)runIndividuallyWithInput:(id)a3;
- (void)setFirewallStore:(id)a3;
- (void)setServiceController:(id)a3;
@end

@implementation IDSFirewallEndpointDonationComponent

- (IDSFirewallEndpointDonationComponent)initWithServiceController:(id)a3 firewallStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSFirewallEndpointDonationComponent;
  v9 = [(IDSFirewallEndpointDonationComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceController, a3);
    objc_storeStrong((id *)&v10->_firewallStore, a4);
  }

  return v10;
}

- (BOOL)isCommandExcluded:(id)a3 forService:(id)a4
{
  id v5 = a3;
  v6 = [a4 identifier];
  if (![v6 isEqualToIgnoringCase:IDSServiceNameFaceTimeMulti])
  {

    goto LABEL_5;
  }
  id v7 = [v5 integerValue];

  if (v7 == (id)207)
  {
LABEL_5:
    BOOL v8 = [v5 integerValue] == (id)249;
    goto LABEL_6;
  }
  BOOL v8 = 1;
LABEL_6:

  return v8;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSFirewallEndpointDonationComponent *)self serviceController];
  v6 = [v4 service];
  id v7 = [v5 serviceWithIdentifier:v6];

  if ([v7 disallowFirewallAutoEnroll]) {
    unsigned int v8 = [v4 wantsFirewallDonation];
  }
  else {
    unsigned int v8 = 1;
  }
  v9 = [v4 messageToSend];
  v10 = [v9 additionalDictionary];
  v11 = [v10 objectForKeyedSubscript:@"c"];

  if (v8
    && IDSCommandIsUserInteractiveCommand()
    && ![(IDSFirewallEndpointDonationComponent *)self isCommandExcluded:v11 forService:v7])
  {
    v40 = self;
    v41 = v11;
    v42 = v7;
    objc_super v12 = objc_alloc_init((Class)NSMutableSet);
    id v16 = objc_alloc_init((Class)NSMutableArray);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v43 = v4;
    v17 = [v4 endpoints];
    id v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v45;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          v23 = objc_msgSend(v22, "URI", v40);
          v24 = [v23 prefixedURI];

          if (([v12 containsObject:v24] & 1) == 0)
          {
            id v25 = objc_alloc((Class)IDSFirewallEntry);
            v26 = [v22 URI];
            id v27 = [v25 initWithURI:v26 andLastSeenDate:0];

            v28 = [v22 senderCorrelationIdentifier];
            [v27 setMergeID:v28];

            [v16 addObject:v27];
            [v12 addObject:v24];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v19);
    }

    id v7 = v42;
    id v4 = v43;
    if ([v16 count])
    {
      v29 = [(IDSFirewallEndpointDonationComponent *)v40 firewallStore];
      v30 = [v43 service];
      v31 = +[NSSet setWithObject:v30];
      objc_msgSend(v29, "addEntries:forImpactedServices:category:isDonated:", v16, v31, objc_msgSend(v42, "controlCategory"), objc_msgSend(v43, "wantsFirewallDonation"));
    }
    v32 = +[IDSDServiceController sharedInstance];
    v33 = [v43 service];
    v34 = [v32 serviceWithIdentifier:v33];
    unsigned int v35 = [v34 controlCategory];

    v36 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [v43 guid];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v49 = v35;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v37;
      *(_WORD *)&v49[14] = 2112;
      *(void *)&v49[16] = v16;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "IDSFirewall Update to category %u for GUID %@ addEntries %@", buf, 0x1Cu);
    }
    v11 = v41;
  }
  else
  {
    objc_super v12 = +[IDSFoundationLog delivery];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v4 guid];
      if ([v4 wantsFirewallDonation]) {
        CFStringRef v14 = @"YES";
      }
      else {
        CFStringRef v14 = @"NO";
      }
      *(_DWORD *)buf = 138413058;
      if ([v7 disallowFirewallAutoEnroll]) {
        CFStringRef v15 = @"YES";
      }
      else {
        CFStringRef v15 = @"NO";
      }
      *(void *)v49 = v13;
      *(_WORD *)&v49[8] = 2112;
      *(void *)&v49[10] = v14;
      *(_WORD *)&v49[18] = 2112;
      *(void *)&v49[20] = v15;
      __int16 v50 = 2112;
      v51 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "IDSFirewall GUID %@ Not donating to the firewall { wantsFirewallDonation: %@, disallowFirewallAutoEnroll: %@, command: %@", buf, 0x2Au);
    }
  }

  v38 = +[CUTUnsafePromise fulfilledPromiseWithValue:v4];

  return v38;
}

- (IDSDServiceController)serviceController
{
  return self->_serviceController;
}

- (void)setServiceController:(id)a3
{
}

- (IDSFirewallStore)firewallStore
{
  return self->_firewallStore;
}

- (void)setFirewallStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firewallStore, 0);

  objc_storeStrong((id *)&self->_serviceController, 0);
}

@end