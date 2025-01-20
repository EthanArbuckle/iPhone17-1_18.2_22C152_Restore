@interface ESDataHandler
+ (id)newDataHandlerForDataclass:(int64_t)a3 container:(void *)a4 changeTrackingID:(id)a5 accountID:(id)a6;
- (BOOL)closeDBAndSave:(BOOL)a3;
- (BOOL)saveContainer;
- (BOOL)wipeServerIds;
- (ESDataHandler)initWithContainer:(void *)a3 changeTrackingID:(id)a4 accountID:(id)a5;
- (NSString)accountID;
- (NSString)changeTrackingID;
- (id)copyOfAllLocalObjectsInContainer;
- (id)getDAExceptionObjectWithLocalItem:(void *)a3 originalEvent:(id)a4 account:(id)a5;
- (id)getDAObjectWithLocalItem:(void *)a3 serverId:(id)a4 account:(id)a5;
- (int)getIdFromLocalObject:(void *)a3;
- (int64_t)dataclass;
- (void)container;
- (void)copyLocalObjectFromId:(int)a3;
- (void)dealloc;
- (void)drainContainer;
- (void)drainSuperfluousChanges;
- (void)openDB;
- (void)setAccountID:(id)a3;
- (void)setChangeTrackingID:(id)a3;
- (void)setContainer:(void *)a3;
@end

@implementation ESDataHandler

- (ESDataHandler)initWithContainer:(void *)a3 changeTrackingID:(id)a4 accountID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"ESDataHandlers.m" lineNumber:21 description:@"Can't initialize a DADataHandler with a nil changeTrackingID"];
  }
  v18.receiver = self;
  v18.super_class = (Class)ESDataHandler;
  v11 = [(ESDataHandler *)&v18 init];
  if (v11)
  {
    if (a3) {
      v11->_container = (void *)CFRetain(a3);
    }
    uint64_t v12 = [v9 copy];
    changeTrackingID = v11->_changeTrackingID;
    v11->_changeTrackingID = (NSString *)v12;

    uint64_t v14 = [v10 copy];
    accountID = v11->_accountID;
    v11->_accountID = (NSString *)v14;
  }
  return v11;
}

- (void)setContainer:(void *)a3
{
  container = self->_container;
  if (container != a3)
  {
    if (container)
    {
      CFRelease(container);
      self->_container = 0;
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_container = a3;
  }
}

- (void)dealloc
{
  container = self->_container;
  if (container)
  {
    CFRelease(container);
    self->_container = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ESDataHandler;
  [(ESDataHandler *)&v4 dealloc];
}

- (int64_t)dataclass
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (int)getIdFromLocalObject:(void *)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)copyLocalObjectFromId:(int)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)saveContainer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)copyOfAllLocalObjectsInContainer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)drainContainer
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)wipeServerIds
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)drainSuperfluousChanges
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
}

- (void)openDB
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)closeDBAndSave:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  os_log_type_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

+ (id)newDataHandlerForDataclass:(int64_t)a3 container:(void *)a4 changeTrackingID:(id)a5 accountID:(id)a6
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v7 = DALoggingwithCategory();
  os_log_type_t v8 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v7, v8))
  {
    int v10 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v7, v8, "%s to be implemented by subclass", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (id)getDAObjectWithLocalItem:(void *)a3 serverId:(id)a4 account:(id)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    int v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (id)getDAExceptionObjectWithLocalItem:(void *)a3 originalEvent:(id)a4 account:(id)a5
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    int v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_239784000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (void)container
{
  return self->_container;
}

- (NSString)changeTrackingID
{
  return self->_changeTrackingID;
}

- (void)setChangeTrackingID:(id)a3
{
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_changeTrackingID, 0);
}

@end