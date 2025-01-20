@interface NEProxySettings
+ (BOOL)supportsSecureCoding;
- (BOOL)FTPEnabled;
- (BOOL)HTTPEnabled;
- (BOOL)HTTPSEnabled;
- (BOOL)RTSPEnabled;
- (BOOL)SOCKSEnabled;
- (BOOL)autoProxyConfigurationEnabled;
- (BOOL)autoProxyDiscovery;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (BOOL)enabled;
- (BOOL)excludeSimpleHostnames;
- (BOOL)gopherEnabled;
- (BOOL)useForAllDomains;
- (BOOL)usePassiveFTP;
- (NEProxyServer)FTPServer;
- (NEProxyServer)HTTPSServer;
- (NEProxyServer)HTTPServer;
- (NEProxyServer)RTSPServer;
- (NEProxyServer)SOCKSServer;
- (NEProxyServer)gopherServer;
- (NEProxySettings)init;
- (NEProxySettings)initWithCoder:(id)a3;
- (NSArray)exceptionList;
- (NSArray)supplementalMatchDomains;
- (NSArray)supplementalMatchOrders;
- (NSString)proxyAutoConfigJavaScript;
- (NSURL)proxyAutoConfigURL;
- (id)copyLegacyDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)initFromLegacyDictionary:(id)a3;
- (void)copyPasswordsFromKeychain;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoProxyConfigurationEnabled:(BOOL)autoProxyConfigurationEnabled;
- (void)setAutoProxyDiscovery:(BOOL)a3;
- (void)setExceptionList:(NSArray *)exceptionList;
- (void)setExcludeSimpleHostnames:(BOOL)excludeSimpleHostnames;
- (void)setFTPEnabled:(BOOL)a3;
- (void)setFTPServer:(id)a3;
- (void)setGopherEnabled:(BOOL)a3;
- (void)setGopherServer:(id)a3;
- (void)setHTTPEnabled:(BOOL)HTTPEnabled;
- (void)setHTTPSEnabled:(BOOL)HTTPSEnabled;
- (void)setHTTPSServer:(NEProxyServer *)HTTPSServer;
- (void)setHTTPServer:(NEProxyServer *)HTTPServer;
- (void)setProxyAutoConfigJavaScript:(id)a3;
- (void)setProxyAutoConfigURL:(id)a3;
- (void)setRTSPEnabled:(BOOL)a3;
- (void)setRTSPServer:(id)a3;
- (void)setSOCKSEnabled:(BOOL)a3;
- (void)setSOCKSServer:(id)a3;
- (void)setSupplementalMatchDomains:(id)a3;
- (void)setSupplementalMatchOrders:(id)a3;
- (void)setUsePassiveFTP:(BOOL)a3;
@end

@implementation NEProxySettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalMatchOrders, 0);
  objc_storeStrong((id *)&self->_supplementalMatchDomains, 0);
  objc_storeStrong((id *)&self->_gopherServer, 0);
  objc_storeStrong((id *)&self->_RTSPServer, 0);
  objc_storeStrong((id *)&self->_SOCKSServer, 0);
  objc_storeStrong((id *)&self->_FTPServer, 0);
  objc_storeStrong((id *)&self->_proxyAutoConfigJavaScript, 0);
  objc_storeStrong((id *)&self->_proxyAutoConfigURL, 0);
  objc_storeStrong((id *)&self->_exceptionList, 0);
  objc_storeStrong((id *)&self->_HTTPSServer, 0);

  objc_storeStrong((id *)&self->_HTTPServer, 0);
}

- (void)setSupplementalMatchOrders:(id)a3
{
}

- (NSArray)supplementalMatchOrders
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSupplementalMatchDomains:(id)a3
{
}

- (NSArray)supplementalMatchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUsePassiveFTP:(BOOL)a3
{
  self->_usePassiveFTP = a3;
}

- (BOOL)usePassiveFTP
{
  return self->_usePassiveFTP;
}

- (void)setGopherServer:(id)a3
{
}

- (NEProxyServer)gopherServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setGopherEnabled:(BOOL)a3
{
  self->_gopherEnabled = a3;
}

- (BOOL)gopherEnabled
{
  return self->_gopherEnabled;
}

- (void)setRTSPServer:(id)a3
{
}

- (NEProxyServer)RTSPServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRTSPEnabled:(BOOL)a3
{
  self->_RTSPEnabled = a3;
}

- (BOOL)RTSPEnabled
{
  return self->_RTSPEnabled;
}

- (void)setSOCKSServer:(id)a3
{
}

- (NEProxyServer)SOCKSServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSOCKSEnabled:(BOOL)a3
{
  self->_SOCKSEnabled = a3;
}

- (BOOL)SOCKSEnabled
{
  return self->_SOCKSEnabled;
}

- (void)setFTPServer:(id)a3
{
}

- (NEProxyServer)FTPServer
{
  return (NEProxyServer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFTPEnabled:(BOOL)a3
{
  self->_FTPEnabled = a3;
}

- (BOOL)FTPEnabled
{
  return self->_FTPEnabled;
}

- (void)setProxyAutoConfigJavaScript:(id)a3
{
}

- (NSString)proxyAutoConfigJavaScript
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProxyAutoConfigURL:(id)a3
{
}

- (NSURL)proxyAutoConfigURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAutoProxyDiscovery:(BOOL)a3
{
  self->_autoProxyDiscovery = a3;
}

- (BOOL)autoProxyDiscovery
{
  return self->_autoProxyDiscovery;
}

- (void)setExceptionList:(NSArray *)exceptionList
{
}

- (NSArray)exceptionList
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setExcludeSimpleHostnames:(BOOL)excludeSimpleHostnames
{
  self->_excludeSimpleHostnames = excludeSimpleHostnames;
}

- (BOOL)excludeSimpleHostnames
{
  return self->_excludeSimpleHostnames;
}

- (void)setHTTPSEnabled:(BOOL)HTTPSEnabled
{
  self->_HTTPSEnabled = HTTPSEnabled;
}

- (BOOL)HTTPSEnabled
{
  return self->_HTTPSEnabled;
}

- (void)setHTTPEnabled:(BOOL)HTTPEnabled
{
  self->_HTTPEnabled = HTTPEnabled;
}

- (BOOL)HTTPEnabled
{
  return self->_HTTPEnabled;
}

- (void)setAutoProxyConfigurationEnabled:(BOOL)autoProxyConfigurationEnabled
{
  self->_autoProxyConfigurationEnabled = autoProxyConfigurationEnabled;
}

- (BOOL)autoProxyConfigurationEnabled
{
  return self->_autoProxyConfigurationEnabled;
}

- (BOOL)useForAllDomains
{
  v3 = [(NEProxySettings *)self matchDomains];
  if (v3)
  {
    v4 = [(NEProxySettings *)self matchDomains];
    if ([v4 count])
    {
      v5 = [(NEProxySettings *)self matchDomains];
      if ([v5 count] == 1)
      {
        v6 = [(NEProxySettings *)self matchDomains];
        v7 = [v6 objectAtIndexedSubscript:0];
        BOOL v8 = [v7 length] == 0;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)enabled
{
  if ([(NEProxySettings *)self HTTPEnabled] || [(NEProxySettings *)self HTTPSEnabled]) {
    return 1;
  }

  return [(NEProxySettings *)self autoProxyConfigurationEnabled];
}

- (void)setHTTPSServer:(NEProxyServer *)HTTPSServer
{
  v7 = HTTPSServer;
  v4 = self;
  objc_sync_enter(v4);
  [(NEProxyServer *)v7 setType:2];
  uint64_t v5 = [(NEProxyServer *)v7 copy];
  v6 = v4->_HTTPSServer;
  v4->_HTTPSServer = (NEProxyServer *)v5;

  objc_sync_exit(v4);
}

- (NEProxyServer)HTTPSServer
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_HTTPSServer;
  objc_sync_exit(v2);

  return v3;
}

- (void)setHTTPServer:(NEProxyServer *)HTTPServer
{
  v7 = HTTPServer;
  v4 = self;
  objc_sync_enter(v4);
  [(NEProxyServer *)v7 setType:1];
  uint64_t v5 = [(NEProxyServer *)v7 copy];
  v6 = v4->_HTTPServer;
  v4->_HTTPServer = (NEProxyServer *)v5;

  objc_sync_exit(v4);
}

- (NEProxyServer)HTTPServer
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_HTTPServer;
  objc_sync_exit(v2);

  return v3;
}

- (void)copyPasswordsFromKeychain
{
  v3 = [(NEProxySettings *)self HTTPServer];
  int v4 = [v3 authenticationRequired];

  if (v4)
  {
    uint64_t v5 = [(NEProxySettings *)self HTTPServer];
    v6 = (void *)[v5 copyPassword];
    v7 = [(NEProxySettings *)self HTTPServer];
    [v7 setPassword:v6];
  }
  BOOL v8 = [(NEProxySettings *)self HTTPSServer];
  int v9 = [v8 authenticationRequired];

  if (v9)
  {
    v10 = [(NEProxySettings *)self HTTPSServer];
    v11 = (void *)[v10 copyPassword];
    v12 = [(NEProxySettings *)self HTTPSServer];
    [v12 setPassword:v11];
  }
  v13 = [(NEProxySettings *)self FTPServer];
  int v14 = [v13 authenticationRequired];

  if (v14)
  {
    v15 = [(NEProxySettings *)self FTPServer];
    v16 = (void *)[v15 copyPassword];
    v17 = [(NEProxySettings *)self FTPServer];
    [v17 setPassword:v16];
  }
  v18 = [(NEProxySettings *)self RTSPServer];
  int v19 = [v18 authenticationRequired];

  if (v19)
  {
    v20 = [(NEProxySettings *)self RTSPServer];
    v21 = (void *)[v20 copyPassword];
    v22 = [(NEProxySettings *)self RTSPServer];
    [v22 setPassword:v21];
  }
  v23 = [(NEProxySettings *)self gopherServer];
  int v24 = [v23 authenticationRequired];

  if (v24)
  {
    v25 = [(NEProxySettings *)self gopherServer];
    v26 = (void *)[v25 copyPassword];
    v27 = [(NEProxySettings *)self gopherServer];
    [v27 setPassword:v26];
  }
  v28 = [(NEProxySettings *)self SOCKSServer];
  int v29 = [v28 authenticationRequired];

  if (v29)
  {
    id v32 = [(NEProxySettings *)self SOCKSServer];
    v30 = (void *)[v32 copyPassword];
    v31 = [(NEProxySettings *)self SOCKSServer];
    [v31 setPassword:v30];
  }
}

- (id)initFromLegacyDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEProxySettings *)self init];
  if (!v5) {
    goto LABEL_63;
  }
  uint64_t v6 = *MEMORY[0x1E4F41EA0];
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EA0]];
  int v8 = isa_nsnumber(v7);

  if (v8)
  {
    int v9 = [v4 objectForKeyedSubscript:v6];
    v5->_autoProxyDiscovery = [v9 BOOLValue];
  }
  uint64_t v10 = *MEMORY[0x1E4F41E88];
  v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E88]];
  int v12 = isa_nsnumber(v11);

  if (v12)
  {
    v13 = [v4 objectForKeyedSubscript:v10];
    v5->_autoProxyConfigurationEnabled = [v13 BOOLValue];
  }
  uint64_t v14 = *MEMORY[0x1E4F41E98];
  v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E98]];
  int v16 = isa_nsstring(v15);

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4F1CB10];
    v18 = [v4 objectForKeyedSubscript:v14];
    uint64_t v19 = [v17 URLWithString:v18];
    proxyAutoConfigURL = v5->_proxyAutoConfigURL;
    v5->_proxyAutoConfigURL = (NSURL *)v19;
  }
  else
  {
    uint64_t v21 = *MEMORY[0x1E4F41E90];
    v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E90]];
    int v23 = isa_nsstring(v22);

    if (!v23) {
      goto LABEL_11;
    }
    v18 = [v4 objectForKeyedSubscript:v21];
    uint64_t v24 = [v18 copy];
    proxyAutoConfigURL = (NSURL *)v5->_proxyAutoConfigJavaScript;
    v5->_proxyAutoConfigJavaScript = (NSString *)v24;
  }

LABEL_11:
  uint64_t v25 = *MEMORY[0x1E4F41E48];
  v26 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E48]];
  int v27 = isa_nsnumber(v26);

  if (v27)
  {
    v28 = [v4 objectForKeyedSubscript:v25];
    v5->_HTTPEnabled = [v28 BOOLValue];
  }
  uint64_t v29 = *MEMORY[0x1E4F41E58];
  v30 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E58]];
  if (!isa_nsstring(v30)) {
    goto LABEL_17;
  }
  uint64_t v31 = *MEMORY[0x1E4F41E50];
  id v32 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E50]];
  int v33 = isa_nsnumber(v32);

  if (v33)
  {
    v34 = [NEProxyServer alloc];
    v35 = [v4 objectForKeyedSubscript:v29];
    v36 = [v4 objectForKeyedSubscript:v31];
    uint64_t v37 = -[NEProxyServer initWithType:address:port:](v34, "initWithType:address:port:", 1, v35, (int)[v36 intValue]);
    HTTPServer = v5->_HTTPServer;
    v5->_HTTPServer = (NEProxyServer *)v37;

    uint64_t v39 = *MEMORY[0x1E4F41E80];
    v40 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E80]];
    LODWORD(v36) = isa_nsstring(v40);

    if (v36)
    {
      [(NEProxyServer *)v5->_HTTPServer setAuthenticationRequired:1];
      v30 = [v4 objectForKeyedSubscript:v39];
      [(NEProxyServer *)v5->_HTTPServer setUsername:v30];
LABEL_17:
    }
  }
  uint64_t v41 = *MEMORY[0x1E4F41E60];
  v42 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E60]];
  int v43 = isa_nsnumber(v42);

  if (v43)
  {
    v44 = [v4 objectForKeyedSubscript:v41];
    v5->_HTTPSEnabled = [v44 BOOLValue];
  }
  uint64_t v45 = *MEMORY[0x1E4F41E70];
  v46 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E70]];
  if (!isa_nsstring(v46)) {
    goto LABEL_24;
  }
  uint64_t v47 = *MEMORY[0x1E4F41E68];
  v48 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E68]];
  int v49 = isa_nsnumber(v48);

  if (v49)
  {
    v50 = [NEProxyServer alloc];
    v51 = [v4 objectForKeyedSubscript:v45];
    v52 = [v4 objectForKeyedSubscript:v47];
    uint64_t v53 = -[NEProxyServer initWithType:address:port:](v50, "initWithType:address:port:", 2, v51, (int)[v52 intValue]);
    HTTPSServer = v5->_HTTPSServer;
    v5->_HTTPSServer = (NEProxyServer *)v53;

    uint64_t v55 = *MEMORY[0x1E4F41E78];
    v56 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E78]];
    LODWORD(v52) = isa_nsstring(v56);

    if (v52)
    {
      [(NEProxyServer *)v5->_HTTPSServer setAuthenticationRequired:1];
      v46 = [v4 objectForKeyedSubscript:v55];
      [(NEProxyServer *)v5->_HTTPSServer setUsername:v46];
LABEL_24:
    }
  }
  uint64_t v57 = *MEMORY[0x1E4F41DF8];
  v58 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41DF8]];
  int v59 = isa_nsnumber(v58);

  if (v59)
  {
    v60 = [v4 objectForKeyedSubscript:v57];
    v5->_FTPEnabled = [v60 BOOLValue];
  }
  uint64_t v61 = *MEMORY[0x1E4F41E10];
  v62 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E10]];
  if (!isa_nsstring(v62)) {
    goto LABEL_31;
  }
  uint64_t v63 = *MEMORY[0x1E4F41E08];
  v64 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E08]];
  int v65 = isa_nsnumber(v64);

  if (v65)
  {
    v66 = [NEProxyServer alloc];
    v67 = [v4 objectForKeyedSubscript:v61];
    v68 = [v4 objectForKeyedSubscript:v63];
    uint64_t v69 = -[NEProxyServer initWithType:address:port:](v66, "initWithType:address:port:", 3, v67, (int)[v68 intValue]);
    FTPServer = v5->_FTPServer;
    v5->_FTPServer = (NEProxyServer *)v69;

    uint64_t v71 = *MEMORY[0x1E4F41E18];
    v72 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E18]];
    LODWORD(v68) = isa_nsstring(v72);

    if (v68)
    {
      [(NEProxyServer *)v5->_FTPServer setAuthenticationRequired:1];
      v62 = [v4 objectForKeyedSubscript:v71];
      [(NEProxyServer *)v5->_FTPServer setUsername:v62];
LABEL_31:
    }
  }
  uint64_t v73 = *MEMORY[0x1E4F41E00];
  v74 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E00]];
  int v75 = isa_nsnumber(v74);

  if (v75)
  {
    v76 = [v4 objectForKeyedSubscript:v73];
    v5->_usePassiveFTP = [v76 BOOLValue];
  }
  uint64_t v77 = *MEMORY[0x1E4F41E28];
  v78 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E28]];
  int v79 = isa_nsnumber(v78);

  if (v79)
  {
    v80 = [v4 objectForKeyedSubscript:v77];
    v5->_gopherEnabled = [v80 BOOLValue];
  }
  uint64_t v81 = *MEMORY[0x1E4F41E38];
  v82 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E38]];
  if (!isa_nsstring(v82)) {
    goto LABEL_40;
  }
  uint64_t v83 = *MEMORY[0x1E4F41E30];
  v84 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E30]];
  int v85 = isa_nsnumber(v84);

  if (v85)
  {
    v86 = [NEProxyServer alloc];
    v87 = [v4 objectForKeyedSubscript:v81];
    v88 = [v4 objectForKeyedSubscript:v83];
    uint64_t v89 = -[NEProxyServer initWithType:address:port:](v86, "initWithType:address:port:", 6, v87, (int)[v88 intValue]);
    gopherServer = v5->_gopherServer;
    v5->_gopherServer = (NEProxyServer *)v89;

    uint64_t v91 = *MEMORY[0x1E4F41E40];
    v92 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41E40]];
    LODWORD(v88) = isa_nsstring(v92);

    if (v88)
    {
      [(NEProxyServer *)v5->_gopherServer setAuthenticationRequired:1];
      v82 = [v4 objectForKeyedSubscript:v91];
      [(NEProxyServer *)v5->_gopherServer setUsername:v82];
LABEL_40:
    }
  }
  uint64_t v93 = *MEMORY[0x1E4F41EA8];
  v94 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EA8]];
  int v95 = isa_nsnumber(v94);

  if (v95)
  {
    v96 = [v4 objectForKeyedSubscript:v93];
    v5->_RTSPEnabled = [v96 BOOLValue];
  }
  uint64_t v97 = *MEMORY[0x1E4F41EB8];
  v98 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EB8]];
  if (!isa_nsstring(v98)) {
    goto LABEL_47;
  }
  uint64_t v99 = *MEMORY[0x1E4F41EB0];
  v100 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EB0]];
  int v101 = isa_nsnumber(v100);

  if (v101)
  {
    v102 = [NEProxyServer alloc];
    v103 = [v4 objectForKeyedSubscript:v97];
    v104 = [v4 objectForKeyedSubscript:v99];
    uint64_t v105 = -[NEProxyServer initWithType:address:port:](v102, "initWithType:address:port:", 4, v103, (int)[v104 intValue]);
    RTSPServer = v5->_RTSPServer;
    v5->_RTSPServer = (NEProxyServer *)v105;

    uint64_t v107 = *MEMORY[0x1E4F41EC0];
    v108 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EC0]];
    LODWORD(v104) = isa_nsstring(v108);

    if (v104)
    {
      [(NEProxyServer *)v5->_RTSPServer setAuthenticationRequired:1];
      v98 = [v4 objectForKeyedSubscript:v107];
      [(NEProxyServer *)v5->_RTSPServer setUsername:v98];
LABEL_47:
    }
  }
  uint64_t v109 = *MEMORY[0x1E4F41EC8];
  v110 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EC8]];
  int v111 = isa_nsnumber(v110);

  if (v111)
  {
    v112 = [v4 objectForKeyedSubscript:v109];
    v5->_SOCKSEnabled = [v112 BOOLValue];
  }
  uint64_t v113 = *MEMORY[0x1E4F41ED8];
  v114 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41ED8]];
  if (isa_nsstring(v114))
  {
    uint64_t v115 = *MEMORY[0x1E4F41ED0];
    v116 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41ED0]];
    int v117 = isa_nsnumber(v116);

    if (!v117) {
      goto LABEL_55;
    }
    v118 = [NEProxyServer alloc];
    v119 = [v4 objectForKeyedSubscript:v113];
    v120 = [v4 objectForKeyedSubscript:v115];
    uint64_t v121 = -[NEProxyServer initWithType:address:port:](v118, "initWithType:address:port:", 5, v119, (int)[v120 intValue]);
    SOCKSServer = v5->_SOCKSServer;
    v5->_SOCKSServer = (NEProxyServer *)v121;

    uint64_t v123 = *MEMORY[0x1E4F41EE0];
    v124 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EE0]];
    LODWORD(v120) = isa_nsstring(v124);

    if (!v120) {
      goto LABEL_55;
    }
    [(NEProxyServer *)v5->_SOCKSServer setAuthenticationRequired:1];
    v114 = [v4 objectForKeyedSubscript:v123];
    [(NEProxyServer *)v5->_SOCKSServer setUsername:v114];
  }

LABEL_55:
  uint64_t v125 = *MEMORY[0x1E4F41DF0];
  v126 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41DF0]];
  int v127 = isa_nsnumber(v126);

  if (v127)
  {
    v128 = [v4 objectForKeyedSubscript:v125];
    v5->_excludeSimpleHostnames = [v128 BOOLValue];
  }
  uint64_t v129 = *MEMORY[0x1E4F41DE8];
  v130 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41DE8]];
  int v131 = isa_nsarray(v130);

  if (v131)
  {
    v132 = [v4 objectForKeyedSubscript:v129];
    uint64_t v133 = [v132 copy];
    exceptionList = v5->_exceptionList;
    v5->_exceptionList = (NSArray *)v133;
  }
  uint64_t v135 = *MEMORY[0x1E4F41EE8];
  v136 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EE8]];
  int v137 = isa_nsarray(v136);

  if (v137)
  {
    v138 = [v4 objectForKeyedSubscript:v135];
    uint64_t v139 = [v138 copy];
    supplementalMatchDomains = v5->_supplementalMatchDomains;
    v5->_supplementalMatchDomains = (NSArray *)v139;
  }
  uint64_t v141 = *MEMORY[0x1E4F41EF0];
  v142 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F41EF0]];
  int v143 = isa_nsarray(v142);

  if (v143)
  {
    v144 = [v4 objectForKeyedSubscript:v141];
    uint64_t v145 = [v144 copy];
    supplementalMatchOrders = v5->_supplementalMatchOrders;
    v5->_supplementalMatchOrders = (NSArray *)v145;
  }
LABEL_63:

  return v5;
}

- (id)copyLegacyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(NEProxySettings *)self autoProxyDiscovery]) {
    id v4 = &unk_1EF08D210;
  }
  else {
    id v4 = &unk_1EF08D228;
  }
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F41EA0]];
  if ([(NEProxySettings *)self autoProxyConfigurationEnabled]) {
    uint64_t v5 = &unk_1EF08D210;
  }
  else {
    uint64_t v5 = &unk_1EF08D228;
  }
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F41E88]];
  uint64_t v6 = [(NEProxySettings *)self proxyAutoConfigURL];

  if (v6)
  {
    v7 = [(NEProxySettings *)self proxyAutoConfigURL];
    int v8 = [v7 absoluteString];
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F41E98]];
  }
  else
  {
    int v9 = [(NEProxySettings *)self proxyAutoConfigJavaScript];

    if (!v9) {
      goto LABEL_12;
    }
    v7 = [(NEProxySettings *)self proxyAutoConfigJavaScript];
    [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F41E90]];
  }

LABEL_12:
  if ([(NEProxySettings *)self HTTPEnabled]) {
    uint64_t v10 = &unk_1EF08D210;
  }
  else {
    uint64_t v10 = &unk_1EF08D228;
  }
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F41E48]];
  v11 = [(NEProxySettings *)self HTTPServer];

  if (v11)
  {
    int v12 = [(NEProxySettings *)self HTTPServer];
    v13 = [v12 address];
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F41E58]];

    uint64_t v14 = NSNumber;
    v15 = [(NEProxySettings *)self HTTPServer];
    int v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "port"));
    [v3 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F41E50]];

    v17 = [(NEProxySettings *)self HTTPServer];
    v18 = [v17 username];

    if (v18)
    {
      uint64_t v19 = [(NEProxySettings *)self HTTPServer];
      v20 = [v19 username];
      [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F41E80]];
    }
  }
  if ([(NEProxySettings *)self HTTPSEnabled]) {
    uint64_t v21 = &unk_1EF08D210;
  }
  else {
    uint64_t v21 = &unk_1EF08D228;
  }
  [v3 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F41E60]];
  v22 = [(NEProxySettings *)self HTTPSServer];

  if (v22)
  {
    int v23 = [(NEProxySettings *)self HTTPSServer];
    uint64_t v24 = [v23 address];
    [v3 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F41E70]];

    uint64_t v25 = NSNumber;
    v26 = [(NEProxySettings *)self HTTPSServer];
    int v27 = objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "port"));
    [v3 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F41E68]];

    v28 = [(NEProxySettings *)self HTTPSServer];
    uint64_t v29 = [v28 username];

    if (v29)
    {
      v30 = [(NEProxySettings *)self HTTPSServer];
      uint64_t v31 = [v30 username];
      [v3 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F41E78]];
    }
  }
  if ([(NEProxySettings *)self FTPEnabled]) {
    id v32 = &unk_1EF08D210;
  }
  else {
    id v32 = &unk_1EF08D228;
  }
  [v3 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F41DF8]];
  if ([(NEProxySettings *)self usePassiveFTP]) {
    int v33 = &unk_1EF08D210;
  }
  else {
    int v33 = &unk_1EF08D228;
  }
  [v3 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F41E00]];
  v34 = [(NEProxySettings *)self FTPServer];

  if (v34)
  {
    v35 = [(NEProxySettings *)self FTPServer];
    v36 = [v35 address];
    [v3 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F41E10]];

    uint64_t v37 = NSNumber;
    v38 = [(NEProxySettings *)self FTPServer];
    uint64_t v39 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v38, "port"));
    [v3 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F41E08]];

    v40 = [(NEProxySettings *)self FTPServer];
    uint64_t v41 = [v40 username];

    if (v41)
    {
      v42 = [(NEProxySettings *)self FTPServer];
      int v43 = [v42 username];
      [v3 setObject:v43 forKeyedSubscript:*MEMORY[0x1E4F41E18]];
    }
  }
  if ([(NEProxySettings *)self gopherEnabled]) {
    v44 = &unk_1EF08D210;
  }
  else {
    v44 = &unk_1EF08D228;
  }
  [v3 setObject:v44 forKeyedSubscript:*MEMORY[0x1E4F41E28]];
  uint64_t v45 = [(NEProxySettings *)self gopherServer];

  if (v45)
  {
    v46 = [(NEProxySettings *)self gopherServer];
    uint64_t v47 = [v46 address];
    [v3 setObject:v47 forKeyedSubscript:*MEMORY[0x1E4F41E38]];

    v48 = NSNumber;
    int v49 = [(NEProxySettings *)self gopherServer];
    v50 = objc_msgSend(v48, "numberWithInteger:", objc_msgSend(v49, "port"));
    [v3 setObject:v50 forKeyedSubscript:*MEMORY[0x1E4F41E30]];

    v51 = [(NEProxySettings *)self gopherServer];
    v52 = [v51 username];

    if (v52)
    {
      uint64_t v53 = [(NEProxySettings *)self gopherServer];
      v54 = [v53 username];
      [v3 setObject:v54 forKeyedSubscript:*MEMORY[0x1E4F41E40]];
    }
  }
  if ([(NEProxySettings *)self RTSPEnabled]) {
    uint64_t v55 = &unk_1EF08D210;
  }
  else {
    uint64_t v55 = &unk_1EF08D228;
  }
  [v3 setObject:v55 forKeyedSubscript:*MEMORY[0x1E4F41EA8]];
  v56 = [(NEProxySettings *)self RTSPServer];

  if (v56)
  {
    uint64_t v57 = [(NEProxySettings *)self RTSPServer];
    v58 = [v57 address];
    [v3 setObject:v58 forKeyedSubscript:*MEMORY[0x1E4F41EB8]];

    int v59 = NSNumber;
    v60 = [(NEProxySettings *)self RTSPServer];
    uint64_t v61 = objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "port"));
    [v3 setObject:v61 forKeyedSubscript:*MEMORY[0x1E4F41EB0]];

    v62 = [(NEProxySettings *)self RTSPServer];
    uint64_t v63 = [v62 username];

    if (v63)
    {
      v64 = [(NEProxySettings *)self RTSPServer];
      int v65 = [v64 username];
      [v3 setObject:v65 forKeyedSubscript:*MEMORY[0x1E4F41EC0]];
    }
  }
  if ([(NEProxySettings *)self SOCKSEnabled]) {
    v66 = &unk_1EF08D210;
  }
  else {
    v66 = &unk_1EF08D228;
  }
  [v3 setObject:v66 forKeyedSubscript:*MEMORY[0x1E4F41EC8]];
  v67 = [(NEProxySettings *)self SOCKSServer];

  if (v67)
  {
    v68 = [(NEProxySettings *)self SOCKSServer];
    uint64_t v69 = [v68 address];
    [v3 setObject:v69 forKeyedSubscript:*MEMORY[0x1E4F41ED8]];

    v70 = NSNumber;
    uint64_t v71 = [(NEProxySettings *)self SOCKSServer];
    v72 = objc_msgSend(v70, "numberWithInteger:", objc_msgSend(v71, "port"));
    [v3 setObject:v72 forKeyedSubscript:*MEMORY[0x1E4F41ED0]];

    uint64_t v73 = [(NEProxySettings *)self SOCKSServer];
    v74 = [v73 username];

    if (v74)
    {
      int v75 = [(NEProxySettings *)self SOCKSServer];
      v76 = [v75 username];
      [v3 setObject:v76 forKeyedSubscript:*MEMORY[0x1E4F41EE0]];
    }
  }
  if ([(NEProxySettings *)self excludeSimpleHostnames]) {
    uint64_t v77 = &unk_1EF08D210;
  }
  else {
    uint64_t v77 = &unk_1EF08D228;
  }
  [v3 setObject:v77 forKeyedSubscript:*MEMORY[0x1E4F41DF0]];
  v78 = [(NEProxySettings *)self exceptionList];

  if (v78)
  {
    int v79 = [(NEProxySettings *)self exceptionList];
    [v3 setObject:v79 forKeyedSubscript:*MEMORY[0x1E4F41DE8]];
  }
  v80 = [(NEProxySettings *)self supplementalMatchDomains];

  if (v80)
  {
    uint64_t v81 = [(NEProxySettings *)self supplementalMatchDomains];
    [v3 setObject:v81 forKeyedSubscript:*MEMORY[0x1E4F41EE8]];
  }
  v82 = [(NEProxySettings *)self supplementalMatchOrders];

  if (v82)
  {
    uint64_t v83 = [(NEProxySettings *)self supplementalMatchOrders];
    [v3 setObject:v83 forKeyedSubscript:*MEMORY[0x1E4F41EF0]];
  }
  return v3;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  unint64_t v8 = a4 & 0xFFFFFFFFFFFFFFF7;
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"), @"autoProxyDiscovery", v5, a4 & 0xFFFFFFFFFFFFFFF7);
  a4 |= 8uLL;
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"), @"autoProxyConfigurationEnabled", v5, a4);
  int v9 = [(NEProxySettings *)self proxyAutoConfigURL];
  uint64_t v10 = [v9 absoluteString];
  [v7 appendPrettyObject:v10 withName:@"proxyAutoConfigurationURL" andIndent:v5 options:a4];

  v11 = [(NEProxySettings *)self proxyAutoConfigJavaScript];
  [v7 appendPrettyObject:v11 withName:@"proxyAutoConfigurationJavaScript" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"), @"HTTPEnabled", v5, a4);
  int v12 = [(NEProxySettings *)self HTTPServer];
  [v7 appendPrettyObject:v12 withName:@"HTTPServer" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"), @"HTTPSEnabled", v5, a4);
  v13 = [(NEProxySettings *)self HTTPSServer];
  [v7 appendPrettyObject:v13 withName:@"HTTPSServer" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings FTPEnabled](self, "FTPEnabled"), @"FTPEnabled", v5, v8);
  uint64_t v14 = [(NEProxySettings *)self FTPServer];
  [v7 appendPrettyObject:v14 withName:@"FTPServer" andIndent:v5 options:v8];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"), @"SOCKSEnabled", v5, v8);
  v15 = [(NEProxySettings *)self SOCKSServer];
  [v7 appendPrettyObject:v15 withName:@"SOCKSServer" andIndent:v5 options:v8];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"), @"RTSPEnabled", v5, v8);
  int v16 = [(NEProxySettings *)self RTSPServer];
  [v7 appendPrettyObject:v16 withName:@"RTSPServer" andIndent:v5 options:v8];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings gopherEnabled](self, "gopherEnabled"), @"gopherEnabled", v5, v8);
  v17 = [(NEProxySettings *)self gopherServer];
  [v7 appendPrettyObject:v17 withName:@"gopherServer" andIndent:v5 options:v8];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"), @"excludeSimpleHostnames", v5, v8);
  v18 = [(NEProxySettings *)self exceptionList];
  [v7 appendPrettyObject:v18 withName:@"exceptionList" andIndent:v5 options:v8];

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"), @"usePassiveFTP", v5, v8);
  uint64_t v19 = [(NEProxySettings *)self supplementalMatchDomains];
  [v7 appendPrettyObject:v19 withName:@"supplementalMatchDomains" andIndent:v5 options:a4];

  v20 = [(NEProxySettings *)self supplementalMatchOrders];
  [v7 appendPrettyObject:v20 withName:@"supplementalMatchOrders" andIndent:v5 options:a4];

  return v7;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NEProxySettings *)self HTTPServer];
  if (v5)
  {
    uint64_t v6 = [(NEProxySettings *)self HTTPServer];
    char v7 = [v6 checkValidityAndCollectErrors:v4];
  }
  else
  {
    char v7 = 1;
  }

  uint64_t v8 = [(NEProxySettings *)self HTTPSServer];
  if (v8)
  {
    int v9 = (void *)v8;
    uint64_t v10 = [(NEProxySettings *)self HTTPSServer];
    char v11 = [v10 checkValidityAndCollectErrors:v4];

    v7 &= v11;
  }
  uint64_t v12 = [(NEProxySettings *)self FTPServer];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(NEProxySettings *)self FTPServer];
    char v15 = [v14 checkValidityAndCollectErrors:v4];

    v7 &= v15;
  }
  uint64_t v16 = [(NEProxySettings *)self SOCKSServer];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(NEProxySettings *)self SOCKSServer];
    char v19 = [v18 checkValidityAndCollectErrors:v4];

    v7 &= v19;
  }
  uint64_t v20 = [(NEProxySettings *)self RTSPServer];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    v22 = [(NEProxySettings *)self RTSPServer];
    char v23 = [v22 checkValidityAndCollectErrors:v4];

    v7 &= v23;
  }
  uint64_t v24 = [(NEProxySettings *)self gopherServer];
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    v26 = [(NEProxySettings *)self gopherServer];
    char v27 = [v26 checkValidityAndCollectErrors:v4];

    v7 &= v27;
  }
  v28 = [(NEProxySettings *)self exceptionList];

  if (v28)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v29 = [(NEProxySettings *)self exceptionList];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(v29);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v55 + 1) + 8 * i)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Non-string for proxy exception", v4);
            char v7 = 0;
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v31);
    }
  }
  v34 = [(NEProxySettings *)self supplementalMatchDomains];

  if (v34)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v35 = [(NEProxySettings *)self supplementalMatchDomains];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(v35);
          }
          if ((isa_nsstring(*(void **)(*((void *)&v51 + 1) + 8 * j)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Non-string for proxy supplemental match domain", v4);
            char v7 = 0;
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v37);
    }
  }
  v40 = [(NEProxySettings *)self supplementalMatchOrders];

  if (v40)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v41 = [(NEProxySettings *)self supplementalMatchOrders];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(v41);
          }
          if ((isa_nsnumber(*(void **)(*((void *)&v47 + 1) + 8 * k)) & 1) == 0)
          {
            +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Non-number for proxy supplemental match order", v4);
            char v7 = 0;
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v43);
    }
  }
  return v7 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NEProxySettings allocWithZone:a3] init];
  [(NEProxySettings *)v4 setAutoProxyDiscovery:[(NEProxySettings *)self autoProxyDiscovery]];
  [(NEProxySettings *)v4 setAutoProxyConfigurationEnabled:[(NEProxySettings *)self autoProxyConfigurationEnabled]];
  uint64_t v5 = [(NEProxySettings *)self proxyAutoConfigURL];
  [(NEProxySettings *)v4 setProxyAutoConfigURL:v5];

  uint64_t v6 = [(NEProxySettings *)self proxyAutoConfigJavaScript];
  [(NEProxySettings *)v4 setProxyAutoConfigJavaScript:v6];

  [(NEProxySettings *)v4 setHTTPEnabled:[(NEProxySettings *)self HTTPEnabled]];
  char v7 = [(NEProxySettings *)self HTTPServer];
  [(NEProxySettings *)v4 setHTTPServer:v7];

  [(NEProxySettings *)v4 setHTTPSEnabled:[(NEProxySettings *)self HTTPSEnabled]];
  uint64_t v8 = [(NEProxySettings *)self HTTPSServer];
  [(NEProxySettings *)v4 setHTTPSServer:v8];

  [(NEProxySettings *)v4 setFTPEnabled:[(NEProxySettings *)self FTPEnabled]];
  int v9 = [(NEProxySettings *)self FTPServer];
  [(NEProxySettings *)v4 setFTPServer:v9];

  [(NEProxySettings *)v4 setSOCKSEnabled:[(NEProxySettings *)self SOCKSEnabled]];
  uint64_t v10 = [(NEProxySettings *)self SOCKSServer];
  [(NEProxySettings *)v4 setSOCKSServer:v10];

  [(NEProxySettings *)v4 setRTSPEnabled:[(NEProxySettings *)self RTSPEnabled]];
  char v11 = [(NEProxySettings *)self RTSPServer];
  [(NEProxySettings *)v4 setRTSPServer:v11];

  [(NEProxySettings *)v4 setGopherEnabled:[(NEProxySettings *)self gopherEnabled]];
  uint64_t v12 = [(NEProxySettings *)self gopherServer];
  [(NEProxySettings *)v4 setGopherServer:v12];

  [(NEProxySettings *)v4 setExcludeSimpleHostnames:[(NEProxySettings *)self excludeSimpleHostnames]];
  v13 = [(NEProxySettings *)self exceptionList];
  [(NEProxySettings *)v4 setExceptionList:v13];

  [(NEProxySettings *)v4 setUsePassiveFTP:[(NEProxySettings *)self usePassiveFTP]];
  uint64_t v14 = [(NEProxySettings *)self supplementalMatchDomains];
  [(NEProxySettings *)v4 setSupplementalMatchDomains:v14];

  char v15 = [(NEProxySettings *)self supplementalMatchOrders];
  [(NEProxySettings *)v4 setSupplementalMatchOrders:v15];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings autoProxyDiscovery](self, "autoProxyDiscovery"), @"AutoProxyDiscovery");
  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings autoProxyConfigurationEnabled](self, "autoProxyConfigurationEnabled"), @"AutoProxyConfigurationEnabled");
  uint64_t v5 = [(NEProxySettings *)self proxyAutoConfigURL];
  [v4 encodeObject:v5 forKey:@"AutoConfigURL"];

  uint64_t v6 = [(NEProxySettings *)self proxyAutoConfigJavaScript];
  [v4 encodeObject:v6 forKey:@"AutoConfigJavaScript"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings HTTPEnabled](self, "HTTPEnabled"), @"HTTPEnabled");
  char v7 = [(NEProxySettings *)self HTTPServer];
  [v4 encodeObject:v7 forKey:@"HTTPServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings HTTPSEnabled](self, "HTTPSEnabled"), @"HTTPSEnabled");
  uint64_t v8 = [(NEProxySettings *)self HTTPSServer];
  [v4 encodeObject:v8 forKey:@"HTTPSServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings FTPEnabled](self, "FTPEnabled"), @"FTPEnabled");
  int v9 = [(NEProxySettings *)self FTPServer];
  [v4 encodeObject:v9 forKey:@"FTPServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings SOCKSEnabled](self, "SOCKSEnabled"), @"SOCKSEnabled");
  uint64_t v10 = [(NEProxySettings *)self SOCKSServer];
  [v4 encodeObject:v10 forKey:@"SOCKSServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings RTSPEnabled](self, "RTSPEnabled"), @"RTSPEnabled");
  char v11 = [(NEProxySettings *)self RTSPServer];
  [v4 encodeObject:v11 forKey:@"RTSPServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings gopherEnabled](self, "gopherEnabled"), @"GopherEnabled");
  uint64_t v12 = [(NEProxySettings *)self gopherServer];
  [v4 encodeObject:v12 forKey:@"GopherServer"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings excludeSimpleHostnames](self, "excludeSimpleHostnames"), @"ExcludeSimpleHostnames");
  v13 = [(NEProxySettings *)self exceptionList];
  [v4 encodeObject:v13 forKey:@"ExceptionList"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NEProxySettings usePassiveFTP](self, "usePassiveFTP"), @"UsePassiveFTP");
  uint64_t v14 = [(NEProxySettings *)self supplementalMatchDomains];
  [v4 encodeObject:v14 forKey:@"SupplementalMatchDomains"];

  id v15 = [(NEProxySettings *)self supplementalMatchOrders];
  [v4 encodeObject:v15 forKey:@"SupplementalMatchOrders"];
}

- (NEProxySettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)NEProxySettings;
  uint64_t v5 = [(NEProxySettings *)&v38 init];
  if (v5)
  {
    v5->_autoProxyDiscovery = [v4 decodeBoolForKey:@"AutoProxyDiscovery"];
    v5->_autoProxyConfigurationEnabled = [v4 decodeBoolForKey:@"AutoProxyConfigurationEnabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoConfigURL"];
    proxyAutoConfigURL = v5->_proxyAutoConfigURL;
    v5->_proxyAutoConfigURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AutoConfigJavaScript"];
    proxyAutoConfigJavaScript = v5->_proxyAutoConfigJavaScript;
    v5->_proxyAutoConfigJavaScript = (NSString *)v8;

    v5->_HTTPEnabled = [v4 decodeBoolForKey:@"HTTPEnabled"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTPServer"];
    HTTPServer = v5->_HTTPServer;
    v5->_HTTPServer = (NEProxyServer *)v10;

    v5->_HTTPSEnabled = [v4 decodeBoolForKey:@"HTTPSEnabled"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HTTPSServer"];
    HTTPSServer = v5->_HTTPSServer;
    v5->_HTTPSServer = (NEProxyServer *)v12;

    v5->_FTPEnabled = [v4 decodeBoolForKey:@"FTPEnabled"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FTPServer"];
    FTPServer = v5->_FTPServer;
    v5->_FTPServer = (NEProxyServer *)v14;

    v5->_SOCKSEnabled = [v4 decodeBoolForKey:@"SOCKSEnabled"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SOCKSServer"];
    SOCKSServer = v5->_SOCKSServer;
    v5->_SOCKSServer = (NEProxyServer *)v16;

    v5->_RTSPEnabled = [v4 decodeBoolForKey:@"RTSPEnabled"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RTSPServer"];
    RTSPServer = v5->_RTSPServer;
    v5->_RTSPServer = (NEProxyServer *)v18;

    v5->_gopherEnabled = [v4 decodeBoolForKey:@"GopherEnabled"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GopherServer"];
    gopherServer = v5->_gopherServer;
    v5->_gopherServer = (NEProxyServer *)v20;

    v5->_excludeSimpleHostnames = [v4 decodeBoolForKey:@"ExcludeSimpleHostnames"];
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"ExceptionList"];
    exceptionList = v5->_exceptionList;
    v5->_exceptionList = (NSArray *)v25;

    v5->_usePassiveFTP = [v4 decodeBoolForKey:@"UsePassiveFTP"];
    char v27 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"SupplementalMatchDomains"];
    supplementalMatchDomains = v5->_supplementalMatchDomains;
    v5->_supplementalMatchDomains = (NSArray *)v30;

    uint64_t v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"SupplementalMatchOrders"];
    supplementalMatchOrders = v5->_supplementalMatchOrders;
    v5->_supplementalMatchOrders = (NSArray *)v35;
  }
  return v5;
}

- (NEProxySettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEProxySettings;
  result = [(NEProxySettings *)&v3 init];
  if (result) {
    result->_usePassiveFTP = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end