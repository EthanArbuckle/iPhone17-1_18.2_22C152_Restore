@interface CalXMLSanitizer
- (CalXMLSanitizer)init;
- (NSString)scrubbedXML;
- (__sFILE)output;
- (id)currentRedactionRule;
- (id)getIndentation;
- (void)_appendNamespaceURI:(id)a3 forElementName:(id)a4 qualifiedName:(id)a5;
- (void)flushContents;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCDATA:(id)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 foundComment:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)setOutput:(__sFILE *)a3;
@end

@implementation CalXMLSanitizer

- (CalXMLSanitizer)init
{
  v14.receiver = self;
  v14.super_class = (Class)CalXMLSanitizer;
  v2 = [(CalXMLSanitizer *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    xml = v2->_xml;
    v2->_xml = (NSMutableString *)v3;

    uint64_t v5 = objc_opt_new();
    cachedIndents = v2->_cachedIndents;
    v2->_cachedIndents = (NSMutableArray *)v5;

    [(NSMutableArray *)v2->_cachedIndents addObject:&stru_1F1509B08];
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    namespaceURIToLevelOfFirstElementInNamespace = v2->namespaceURIToLevelOfFirstElementInNamespace;
    v2->namespaceURIToLevelOfFirstElementInNamespace = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    elementNames = v2->elementNames;
    v2->elementNames = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    elementNamespaces = v2->elementNamespaces;
    v2->elementNamespaces = v11;
  }
  return v2;
}

- (id)getIndentation
{
  unint64_t v3 = [(NSMutableArray *)self->_cachedIndents count];
  unint64_t nestingLevel = self->_nestingLevel;
  if (v3 <= nestingLevel)
  {
    uint64_t v5 = [(NSMutableArray *)self->_cachedIndents lastObject];
    unint64_t v6 = [(NSMutableArray *)self->_cachedIndents count];
    if (v6 <= self->_nestingLevel)
    {
      unint64_t v8 = v6;
      do
      {
        v7 = [v5 stringByAppendingString:@"  "];

        [(NSMutableArray *)self->_cachedIndents addObject:v7];
        ++v8;
        uint64_t v5 = v7;
      }
      while (v8 <= self->_nestingLevel);
    }
    else
    {
      v7 = v5;
    }

    unint64_t nestingLevel = self->_nestingLevel;
  }
  cachedIndents = self->_cachedIndents;
  return (id)[(NSMutableArray *)cachedIndents objectAtIndexedSubscript:nestingLevel];
}

- (id)currentRedactionRule
{
  unint64_t v3 = [(NSMutableArray *)self->elementNames lastObject];
  if (v3)
  {
    v4 = [(NSMutableArray *)self->elementNamespaces lastObject];
    if (currentRedactionRule_onceToken != -1) {
      dispatch_once(&currentRedactionRule_onceToken, &__block_literal_global_114);
    }
    uint64_t v5 = [(id)currentRedactionRule_redactionRules objectForKeyedSubscript:v4];
    unint64_t v6 = v5;
    if (v5)
    {
      v7 = [v5 objectForKeyedSubscript:v3];
      id v8 = v7;
      if (v7)
      {
        id v8 = v7;
        id v9 = v8;
      }
      else
      {
        v11 = [NSString stringWithFormat:@"%@>%@", v4, v3];
        v12 = currentRedactionRule_logDedupingQueue;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __39__CalXMLSanitizer_currentRedactionRule__block_invoke_120;
        v15[3] = &unk_1E624E9B0;
        id v16 = v11;
        id v17 = v4;
        id v18 = v3;
        id v13 = v11;
        dispatch_sync(v12, v15);
        id v9 = (id)kUnknownElementRedactionRule;
      }
    }
    else
    {
      v10 = currentRedactionRule_logDedupingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2;
      block[3] = &unk_1E624E580;
      id v20 = v4;
      id v21 = v3;
      dispatch_sync(v10, block);
      id v9 = (id)kUnknownElementRedactionRule;

      id v8 = v20;
    }
  }
  else
  {
    id v9 = (id)kUnknownElementRedactionRule;
  }

  return v9;
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v224[0] = MEMORY[0x1E4F143A8];
  v224[1] = 3221225472;
  v224[2] = ___createRedactionRules_block_invoke;
  v224[3] = &unk_1E624EA28;
  id v223 = v0;
  id v225 = v223;
  v1 = (uint64_t (**)(void, void, void, void))MEMORY[0x1C1867AB0](v224);
  id v2 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"propfind", 0);
  id v3 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"prop", 0);
  id v4 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"current-user-principal", 0);
  id v5 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"displayname", 2);
  id v6 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"principal-collection-set", 0);
  id v7 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"principal-URL", 0);
  id v8 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"resource-id", 0);
  id v9 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"supported-report-set", 0);
  id v10 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"supported-report", 0);
  id v11 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"report", 0);
  id v12 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"acl-principal-prop-set", 0);
  id v13 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"principal-match", 0);
  id v14 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"principal-property-search", 0);
  id v15 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"expand-property", 0);
  id v16 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"sync-collection", 0);
  id v17 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"multistatus", 0);
  id v18 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"response", 0);
  id v19 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"responsedescription", 5);
  id v20 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"propstat", 0);
  id v21 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"status", 5);
  id v22 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"sync-token", 5);
  id v23 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"sync-level", 5);
  id v24 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"owner", 0);
  id v25 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"add-member", 0);
  id v26 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"quota-used-bytes", 5);
  id v27 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"quota-available-bytes", 5);
  id v28 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"current-user-privilege-set", 0);
  id v29 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"all", 0);
  id v30 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"bind", 0);
  id v31 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"collection", 0);
  id v32 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"error", 0);
  id v33 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"getcontenttype", 5);
  id v34 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"getetag", 5);
  id v35 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"group-member-set", 0);
  id v36 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"number-of-matches-within-limits", 0);
  id v37 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"principal-search-property-set", 0);
  id v38 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"principal-search-property", 0);
  id v39 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"privilege", 0);
  id v40 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"propertyupdate", 0);
  id v41 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"read-acl", 0);
  id v42 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"read-current-user-privilege-set", 0);
  id v43 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"read", 0);
  id v44 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"resourcetype", 0);
  id v45 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"set", 0);
  id v46 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"unbind", 0);
  id v47 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"unlock", 0);
  id v48 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"write-acl", 0);
  id v49 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"write-content", 0);
  id v50 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"write-properties", 0);
  id v51 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"write", 0);
  id v52 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-home-set", 0);
  id v53 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-user-address-set", 0);
  id v54 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-inbox-URL", 0);
  id v55 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-outbox-URL", 0);
  id v56 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-alarm", 0);
  id v57 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"supported-calendar-component-set", 0);
  id v58 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"default-alarm-vevent-date", 4);
  id v59 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"default-alarm-vevent-datetime", 4);
  id v60 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-description", 0);
  id v61 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-timezone", 3);
  id v62 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"supported-calendar-component-sets", 0);
  id v63 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-calendar-transp", 0);
  id v64 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-data", 3);
  id v65 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-free-busy-set", 0);
  id v66 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-multiget", 0);
  id v67 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-query", 0);
  id v68 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar-user-type", 0);
  id v69 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"calendar", 0);
  id v70 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"default-alarm-vevent-date", 4);
  id v71 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"filter", 0);
  id v72 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"free-busy-query", 0);
  id v73 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"opaque", 0);
  id v74 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"read-free-busy", 0);
  id v75 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"recipient", 0);
  id v76 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"response", 0);
  id v77 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"request-status", 5);
  id v78 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-default-calendar-URL", 0);
  id v79 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-deliver", 0);
  id v80 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-inbox", 0);
  id v81 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-outbox", 0);
  id v82 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-response", 0);
  id v83 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-send", 0);
  id v84 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule-tag", 5);
  id v85 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"schedule", 0);
  id v86 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"transparent", 0);
  id v87 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"dropbox-home-URL", 0);
  id v88 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"email-address-set", 0);
  id v89 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"email-address", 2);
  id v90 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"notification-URL", 0);
  id v91 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"push-transports", 0);
  id v92 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"token-url", 0);
  id v93 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"subscription-url", 0);
  id v94 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"courierserver", 1);
  id v95 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"refresh-interval", 5);
  id v96 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"pushkey", 5);
  id v97 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"pre-publish-url", 0);
  id v98 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"invite", 0);
  id v99 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"subscribed-strip-alarms", 0);
  id v100 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"allowed-sharing-modes", 0);
  id v101 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"access", 0);
  id v102 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"action", 0);
  id v103 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"apsbundleid", 5);
  id v104 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"attendee", 1);
  id v105 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"calendar-proxy-read-for", 0);
  id v106 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"calendar-proxy-write-for", 0);
  id v107 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"calendar-search", 0);
  id v108 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"can-be-published", 0);
  id v109 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"can-be-shared", 0);
  id v110 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"cancel", 0);
  id v111 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"changed-by", 0);
  id v112 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"changes", 0);
  id v113 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"common-name", 2);
  id v114 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"create", 0);
  id v115 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"created-by", 0);
  id v116 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"created", 0);
  id v117 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"dropbox-home", 0);
  id v118 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"dtstamp", 5);
  id v119 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"env", 5);
  id v120 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"first-name", 2);
  id v121 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"firstName", 2);
  id v122 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"free-busy-url", 0);
  id v123 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"getctag", 5);
  id v124 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"hosturl", 0);
  id v125 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"in-reply-to", 5);
  id v126 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"invite-accepted", 0);
  id v127 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"invite-declined", 0);
  id v128 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"invite-deleted", 0);
  id v129 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"invite-noresponse", 0);
  id v130 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"invite-reply", 0);
  id v131 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"last-name", 2);
  id v132 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"lastName", 2);
  id v133 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"master", 0);
  id v134 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"name", 2);
  id v135 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"never-publish", 0);
  id v136 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"never-shared", 0);
  id v137 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"notification", 0);
  id v138 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"notificationtype", 0);
  id v139 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"organizer-cn", 2);
  id v140 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"organizer-first", 0);
  id v141 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"organizer-last", 0);
  id v142 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"organizer", 0);
  id v143 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"publish-url", 0);
  id v144 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"read-write", 0);
  id v145 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"read", 0);
  id v146 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"record-type", 5);
  id v147 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"recurrence", 0);
  id v148 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"recurrenceid", 5);
  id v149 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"remove", 0);
  id v150 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"reply", 0);
  id v151 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"resource-changed", 0);
  id v152 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"schedule-changes", 0);
  id v153 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"search-token", 0);
  id v154 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"set", 0);
  id v155 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"shared-owner", 0);
  id v156 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"shared", 0);
  id v157 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"share", 0);
  id v158 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"source", 0);
  id v159 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"subscribed-strip-attachments", 0);
  id v160 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"subscribed-strip-todos", 0);
  id v161 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"subscribed", 0);
  id v162 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"summary", 2);
  id v163 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"time", 5);
  id v164 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://calendarserver.org/ns/", @"uid", 5);
  id v165 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"update", 0);
  id v166 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"updated-by", 0);
  id v167 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"user", 0);
  id v168 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://cal.me.com/_namespace/", @"apsbundleid", 5);
  id v169 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"verify-calendar-user", 0);
  id v170 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://me.com/_namespace/", @"apsbundleid", 5);
  id v171 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"bulk-requests", 0);
  id v172 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"crud", 0);
  id v173 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"delete", 0);
  id v174 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"insert", 0);
  id v175 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://me.com/_namespace/", @"max-bytes", 5);
  id v176 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://me.com/_namespace/", @"max-resources", 5);
  id v177 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://me.com/_namespace/", @"max-size", 5);
  id v178 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"simple", 0);
  id v179 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"supported", 0);
  id v180 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://me.com/_namespace/", @"update", 0);
  id v181 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"urn:mobileme:davservices", @"env", 5);
  id v182 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://apple.com/ns/ical/", @"location-code", 0);
  id v183 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://apple.com/ns/ical/", @"calendar-order", 5);
  id v184 = (id)((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://apple.com/ns/ical/", @"refreshrate", 5);
  id v185 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://apple.com/ns/ical/", @"autoprovisioned", 0);
  id v186 = (id)((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://apple.com/ns/ical/", @"language-code", 0);
  v222 = ((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"href", 1);
  id v187 = ___createRedactionRules_block_invoke_2((uint64_t)v222, v222, @"preferred", 5);
  v221 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"transport", 0);
  id v188 = ___createRedactionRules_block_invoke_2((uint64_t)v221, v221, @"type", 5);
  v220 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"comp", 0);
  id v189 = ___createRedactionRules_block_invoke_2((uint64_t)v220, v220, @"name", 5);
  v219 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"comp-filter", 0);
  id v190 = ___createRedactionRules_block_invoke_2((uint64_t)v219, v219, @"name", 5);
  v191 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"DAV:", @"property", 0);
  id v192 = ___createRedactionRules_block_invoke_2((uint64_t)v191, v191, @"name", 5);
  id v193 = ___createRedactionRules_block_invoke_2((uint64_t)v192, v191, @"namespace", 5);
  v218 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"invite-notification", 0);
  id v194 = ___createRedactionRules_block_invoke_2((uint64_t)v218, v218, @"shared-type", 5);
  v195 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"urn:ietf:params:xml:ns:caldav", @"time-range", 0);
  id v196 = ___createRedactionRules_block_invoke_2((uint64_t)v195, v195, @"start", 5);
  id v197 = ___createRedactionRules_block_invoke_2((uint64_t)v196, v195, @"end", 5);
  v198 = ((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"http://apple.com/ns/ical/", @"calendar-color", 5);
  id v199 = ___createRedactionRules_block_invoke_2((uint64_t)v198, v198, @"symbolic-color", 5);
  v200 = ((uint64_t (**)(void, __CFString *, __CFString *, uint64_t))v1)[2](v1, @"DAV:", @"description", 5);
  id v201 = ___createRedactionRules_block_invoke_2((uint64_t)v200, v200, @"xml:lang", 5);
  v202 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"changed-property", 0);
  id v203 = ___createRedactionRules_block_invoke_2((uint64_t)v202, v202, @"name", 5);
  v204 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"changed-parameter", 0);
  id v205 = ___createRedactionRules_block_invoke_2((uint64_t)v204, v204, @"name", 5);
  v206 = ((uint64_t (**)(void, __CFString *, __CFString *, void))v1)[2](v1, @"http://calendarserver.org/ns/", @"calendarserver-principal-search", 0);
  id v207 = ___createRedactionRules_block_invoke_2((uint64_t)v206, v206, @"context", 5);
  v208 = objc_alloc_init(CalXMLElementRedactionRule);
  v209 = (void *)kUnknownElementRedactionRule;
  kUnknownElementRedactionRule = (uint64_t)v208;

  [(id)kUnknownElementRedactionRule setElementName:5];
  [(id)kUnknownElementRedactionRule setContent:0];
  [(id)kUnknownElementRedactionRule setCdata:3];
  [0 setAttributeName:5];
  [0 setAttributeValue:0];
  id v210 = v223;

  v211 = (void *)currentRedactionRule_redactionRules;
  currentRedactionRule_redactionRules = (uint64_t)v210;

  id v212 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v213 = (void *)currentRedactionRule_loggedNamespaces;
  currentRedactionRule_loggedNamespaces = (uint64_t)v212;

  id v214 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v215 = (void *)currentRedactionRule_loggedElementNames;
  currentRedactionRule_loggedElementNames = (uint64_t)v214;

  dispatch_queue_t v216 = dispatch_queue_create("com.apple.mobilecal.CalDAVTrafficLogScrubber.elementDedupingQueue", 0);
  v217 = (void *)currentRedactionRule_logDedupingQueue;
  currentRedactionRule_logDedupingQueue = (uint64_t)v216;
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2(uint64_t a1)
{
  v1 = (void *)(a1 + 32);
  if (([(id)currentRedactionRule_loggedNamespaces containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    [(id)currentRedactionRule_loggedNamespaces addObject:*v1];
    id v2 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2_cold_1();
    }
  }
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_120(uint64_t a1)
{
  if (([(id)currentRedactionRule_loggedElementNames containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    [(id)currentRedactionRule_loggedElementNames addObject:*(void *)(a1 + 32)];
    id v2 = +[CalDAVTrafficLogScrubber log];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __39__CalXMLSanitizer_currentRedactionRule__block_invoke_120_cold_1();
    }
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  [(CalXMLSanitizer *)self flushContents];
  [(NSMutableArray *)self->elementNames addObject:v11];
  elementNamespaces = self->elementNamespaces;
  if (v12)
  {
    [(NSMutableArray *)self->elementNamespaces addObject:v12];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableArray *)elementNamespaces addObject:v16];
  }
  id v41 = [(CalXMLSanitizer *)self currentRedactionRule];
  if (!self->_currentElementHasNestedTags && self->_nestingLevel >= 1) {
    [(NSMutableString *)self->_xml appendString:@"\n"];
  }
  uint64_t v17 = [(CalXMLSanitizer *)self getIndentation];
  xml = self->_xml;
  int v19 = [v41 elementName];
  if (v13) {
    id v20 = v13;
  }
  else {
    id v20 = v11;
  }
  id v21 = CalRedactString(v19, v20);
  id v37 = (void *)v17;
  [(NSMutableString *)xml appendFormat:@"%@<%@", v17, v21];

  if ([v12 length])
  {
    id v22 = [(NSMutableDictionary *)self->namespaceURIToLevelOfFirstElementInNamespace objectForKeyedSubscript:v12];

    if (!v22)
    {
      [(CalXMLSanitizer *)self _appendNamespaceURI:v12 forElementName:v11 qualifiedName:v13];
      id v23 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_nestingLevel];
      [(NSMutableDictionary *)self->namespaceURIToLevelOfFirstElementInNamespace setObject:v23 forKeyedSubscript:v12];
    }
  }
  id v38 = v13;
  id v39 = v12;
  id v24 = self;
  id v40 = v11;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v25 = v14;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v31 = [v41 redactionRuleForAttribute:v30];
        id v32 = v24->_xml;
        id v33 = CalRedactString([v31 attributeName], v30);
        int v34 = [v31 attributeValue];
        id v35 = [v25 objectForKeyedSubscript:v30];
        id v36 = CalRedactString(v34, v35);
        [(NSMutableString *)v32 appendFormat:@" %@=\"%@\"", v33, v36];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v27);
  }

  *(_WORD *)&v24->_currentElementStartTagNeedsClosing = 1;
  ++v24->_nestingLevel;
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (*(_OWORD *)&self->_textContents != 0 || self->_mutableCDATAContents) {
    [(CalXMLSanitizer *)self flushContents];
  }
  id v13 = [(CalXMLSanitizer *)self currentRedactionRule];
  [(NSMutableArray *)self->elementNames removeLastObject];
  [(NSMutableArray *)self->elementNamespaces removeLastObject];
  --self->_nestingLevel;
  if (v11)
  {
    id v14 = [(NSMutableDictionary *)self->namespaceURIToLevelOfFirstElementInNamespace objectForKeyedSubscript:v11];
    uint64_t v15 = [v14 integerValue];
    uint64_t nestingLevel = self->_nestingLevel;

    if (v15 == nestingLevel) {
      [(NSMutableDictionary *)self->namespaceURIToLevelOfFirstElementInNamespace removeObjectForKey:v11];
    }
  }
  xml = self->_xml;
  if (self->_currentElementStartTagNeedsClosing)
  {
    [(NSMutableString *)xml appendString:@"/>\n"];
  }
  else
  {
    if ([(NSMutableString *)xml hasSuffix:@"\n"])
    {
      id v18 = self->_xml;
      int v19 = [(CalXMLSanitizer *)self getIndentation];
      [(NSMutableString *)v18 appendString:v19];
    }
    id v20 = self->_xml;
    int v21 = [v13 elementName];
    if (v12) {
      id v22 = v12;
    }
    else {
      id v22 = v10;
    }
    id v23 = CalRedactString(v21, v22);
    [(NSMutableString *)v20 appendFormat:@"</%@>\n", v23];
  }
  *(_WORD *)&self->_currentElementStartTagNeedsClosing = 256;
}

- (void)_appendNamespaceURI:(id)a3 forElementName:(id)a4 qualifiedName:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8 && v13 && v9)
  {
    unint64_t v10 = [v9 length];
    if (v10 > [v8 length]
      && (objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") + ~objc_msgSend(v8, "length")),
          (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v12 = (void *)v11;
      [(NSMutableString *)self->_xml appendFormat:@" xmlns:%@=\"%@\"", v11, v13];
    }
    else
    {
      [(NSMutableString *)self->_xml appendFormat:@" xmlns=\"%@\"", v13];
    }
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  textContents = self->_textContents;
  id v9 = v5;
  if (textContents)
  {
    id v7 = [(NSString *)textContents stringByAppendingString:v5];
  }
  else
  {
    id v7 = (NSString *)v5;
  }
  id v8 = self->_textContents;
  self->_textContents = v7;
}

- (void)parser:(id)a3 foundComment:(id)a4
{
  id v5 = a4;
  [(CalXMLSanitizer *)self flushContents];
  [(NSMutableString *)self->_xml appendFormat:@"<!--%@-->", v5];
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  mutableCDATAContents = self->_mutableCDATAContents;
  if (self->_cdataContents)
  {
    if (!mutableCDATAContents)
    {
      id v8 = (NSMutableData *)[(NSData *)self->_cdataContents mutableCopy];
      id v9 = self->_mutableCDATAContents;
      self->_mutableCDATAContents = v8;

      cdataContents = self->_cdataContents;
      self->_cdataContents = 0;

      uint64_t v11 = self->_mutableCDATAContents;
LABEL_6:
      [(NSMutableData *)v11 appendData:v6];
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v11 = self->_mutableCDATAContents;
    goto LABEL_6;
  }
  if (mutableCDATAContents) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_cdataContents, a4);
LABEL_7:
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v9 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v9 redactedDescription];
  }
  else if (v9)
  {
    id v6 = NSString;
    id v7 = [v9 domain];
    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v9, "code"));
    id v5 = [v6 stringWithFormat:@"[%@:%@]", v7, v8];
  }
  else
  {
    id v5 = @"(null)";
  }
  [(NSMutableString *)self->_xml appendFormat:@"[Parse failure: XML parse error=%@]\n", v5];
}

- (void)flushContents
{
  id v12 = [(CalXMLSanitizer *)self currentRedactionRule];
  if (self->_currentElementStartTagNeedsClosing)
  {
    [(NSMutableString *)self->_xml appendString:@">"];
    self->_currentElementStartTagNeedsClosing = 0;
  }
  if (self->_textContents)
  {
    if (flushContents_onceToken != -1) {
      dispatch_once(&flushContents_onceToken, &__block_literal_global_162);
    }
    if ([(NSString *)self->_textContents rangeOfCharacterFromSet:flushContents_notWhitespaceSet options:0] != 0x7FFFFFFFFFFFFFFFLL)
    {
      xml = self->_xml;
      id v4 = CalRedactString([v12 content], self->_textContents);
      [(NSMutableString *)xml appendString:v4];
    }
    textContents = self->_textContents;
    self->_textContents = 0;
  }
  mutableCDATAContents = self->_mutableCDATAContents;
  if (self->_cdataContents)
  {
    if (!mutableCDATAContents) {
      goto LABEL_14;
    }
  }
  else if (!mutableCDATAContents)
  {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&self->_cdataContents, mutableCDATAContents);
  id v7 = self->_mutableCDATAContents;
  self->_mutableCDATAContents = 0;

LABEL_14:
  id v8 = (void *)[[NSString alloc] initWithData:self->_cdataContents encoding:4];
  id v9 = self->_xml;
  unint64_t v10 = CalRedactString([v12 cdata], v8);
  [(NSMutableString *)v9 appendFormat:@"<![CDATA[%@]]>", v10];

  cdataContents = self->_cdataContents;
  self->_cdataContents = 0;

LABEL_15:
}

void __32__CalXMLSanitizer_flushContents__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)flushContents_notWhitespaceSet;
  flushContents_notWhitespaceSet = v0;
}

- (NSString)scrubbedXML
{
  return (NSString *)self->_xml;
}

- (__sFILE)output
{
  return self->_output;
}

- (void)setOutput:(__sFILE *)a3
{
  self->_output = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xml, 0);
  objc_storeStrong((id *)&self->elementNamespaces, 0);
  objc_storeStrong((id *)&self->elementNames, 0);
  objc_storeStrong((id *)&self->namespaceURIToLevelOfFirstElementInNamespace, 0);
  objc_storeStrong((id *)&self->_mutableCDATAContents, 0);
  objc_storeStrong((id *)&self->_cdataContents, 0);
  objc_storeStrong((id *)&self->_textContents, 0);
  objc_storeStrong((id *)&self->_cachedIndents, 0);
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1BBC88000, v0, OS_LOG_TYPE_DEBUG, "Unknown namespace: \"%@\" for element \"%@\"", v1, 0x16u);
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_120_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1BBC88000, v0, OS_LOG_TYPE_DEBUG, "Unknown element name in namespace \"%@\": \"%@\"", v1, 0x16u);
}

@end