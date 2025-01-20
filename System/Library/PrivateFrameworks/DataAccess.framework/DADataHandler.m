@interface DADataHandler
+ (id)newDataHandlerForDataclass:(int64_t)a3 container:(void *)a4 changeTrackingID:(id)a5;
- (BOOL)closeDBAndSave:(BOOL)a3;
- (BOOL)saveContainer;
- (BOOL)wipeServerIds;
- (DADataHandler)initWithContainer:(void *)a3 changeTrackingID:(id)a4;
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
- (void)setChangeTrackingID:(id)a3;
- (void)setContainer:(void *)a3;
@end

@implementation DADataHandler

- (DADataHandler)initWithContainer:(void *)a3 changeTrackingID:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"DADataHandlers.m" lineNumber:20 description:@"Can't initialize a DADataHandler with a nil changeTrackingID"];
  }
  v13.receiver = self;
  v13.super_class = (Class)DADataHandler;
  v8 = [(DADataHandler *)&v13 init];
  if (v8)
  {
    if (a3) {
      v8->_container = (void *)CFRetain(a3);
    }
    uint64_t v9 = [v7 copy];
    changeTrackingID = v8->_changeTrackingID;
    v8->_changeTrackingID = (NSString *)v9;
  }
  return v8;
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
  v4.super_class = (Class)DADataHandler;
  [(DADataHandler *)&v4 dealloc];
}

- (int64_t)dataclass
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (int)getIdFromLocalObject:(void *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_log_type_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (void)copyLocalObjectFromId:(int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_log_type_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)saveContainer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (id)copyOfAllLocalObjectsInContainer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)drainContainer
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)wipeServerIds
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v6 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (void)drainSuperfluousChanges
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
}

- (void)openDB
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v3, v4))
  {
    int v5 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v3, v4, "%s to be implemented by subclass", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)closeDBAndSave:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_log_type_t v4 = DALoggingwithCategory();
  os_log_type_t v5 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v4, v5))
  {
    int v7 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v4, v5, "%s to be implemented by subclass", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

+ (id)newDataHandlerForDataclass:(int64_t)a3 container:(void *)a4 changeTrackingID:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    int v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (id)getDAObjectWithLocalItem:(void *)a3 serverId:(id)a4 account:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    int v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

- (id)getDAExceptionObjectWithLocalItem:(void *)a3 originalEvent:(id)a4 account:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v6 = DALoggingwithCategory();
  os_log_type_t v7 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 3);
  if (os_log_type_enabled(v6, v7))
  {
    int v9 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_1BA384000, v6, v7, "%s to be implemented by subclass", (uint8_t *)&v9, 0xCu);
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

- (void).cxx_destruct
{
}

@end