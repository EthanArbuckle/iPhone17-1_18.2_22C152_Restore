@interface AXMVisionEngineNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (NSString)title;
+ (void)isSupported;
- (AXMVisionEngineNode)initWithCoder:(id)a3;
- (AXMVisionEngineNode)initWithIdentifier:(id)a3;
- (AXMVisionEngineNodeConnectionDelegate)delegate;
- (BOOL)areDiagnosticsEnabled;
- (BOOL)isConnected;
- (BOOL)isEnabled;
- (BOOL)requiresVisionFramework;
- (BOOL)validateVisionKitSoftLinkSymbols;
- (NSString)identifier;
- (OS_dispatch_queue)nodeQueue;
- (id)axmDescription;
- (void)axmAppendRecursiveDescription:(id)a3 withIndentation:(int64_t)a4;
- (void)connect:(id)a3;
- (void)disconnect;
- (void)encodeWithCoder:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setNodeQueue:(id)a3;
@end

@implementation AXMVisionEngineNode

+ (BOOL)isSupported
{
  v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    +[AXMVisionEngineNode isSupported](v2);
  }

  return 0;
}

- (BOOL)requiresVisionFramework
{
  return 0;
}

+ (NSString)title
{
  v2 = AXMediaLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    +[AXMVisionEngineNode isSupported](v2);
  }

  return (NSString *)@"Unknown";
}

- (AXMVisionEngineNode)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMVisionEngineNode;
  v5 = [(AXMVisionEngineNode *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("NodeQueue", v8);
    nodeQueue = v5->_nodeQueue;
    v5->_nodeQueue = (OS_dispatch_queue *)v9;

    v5->_enabled = 1;
    [(AXMVisionEngineNode *)v5 nodeInitialize];
  }

  return v5;
}

- (BOOL)validateVisionKitSoftLinkSymbols
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMVisionEngineNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:AXMNodeCodingKeyIdentifier];
  uint64_t v6 = [(AXMVisionEngineNode *)self initWithIdentifier:v5];
  if (v6) {
    v6->_enabled = [v4 decodeBoolForKey:AXMNodeCodingKeyEnabled];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(AXMVisionEngineNode *)self identifier];
  [v6 encodeObject:v4 forKey:AXMNodeCodingKeyIdentifier];

  BOOL v5 = [(AXMVisionEngineNode *)self isEnabled];
  [v6 encodeBool:v5 forKey:AXMNodeCodingKeyEnabled];
}

- (void)connect:(id)a3
{
  id v4 = a3;
  if (![(AXMVisionEngineNode *)self isConnected])
  {
    [(AXMVisionEngineNode *)self setDelegate:v4];
    [(AXMVisionEngineNode *)self setConnected:1];
  }
}

- (void)disconnect
{
  [(AXMVisionEngineNode *)self setDelegate:0];

  [(AXMVisionEngineNode *)self setConnected:0];
}

- (BOOL)areDiagnosticsEnabled
{
  v2 = self;
  v3 = [(AXMVisionEngineNode *)self delegate];
  LOBYTE(v2) = [v3 diagnosticsEnabled:v2];

  return (char)v2;
}

- (id)axmDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [(AXMVisionEngineNode *)self identifier];
  v7 = [(id)objc_opt_class() title];
  if ([(id)objc_opt_class() isSupported]) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  if ([(AXMVisionEngineNode *)self requiresVisionFramework]) {
    dispatch_queue_t v9 = @"Y";
  }
  else {
    dispatch_queue_t v9 = @"N";
  }
  if ([(AXMVisionEngineNode *)self isEnabled]) {
    v10 = @"Y";
  }
  else {
    v10 = @"N";
  }
  if ([(AXMVisionEngineNode *)self isConnected]) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  objc_super v12 = [v3 stringWithFormat:@"%@<%p>: ID:'%@' title:'%@' supported:%@ needsVisionKit:%@ enabled:%@ connected:%@", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (void)axmAppendRecursiveDescription:(id)a3 withIndentation:(int64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F28E78];
  id v7 = a3;
  id v9 = [v6 axmIndentationString:a4];
  v8 = [(AXMVisionEngineNode *)self axmDescription];
  [v7 appendFormat:@"%@%@\n", v9, v8];
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (AXMVisionEngineNodeConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMVisionEngineNodeConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)nodeQueue
{
  return self->_nodeQueue;
}

- (void)setNodeQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)isSupported
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "Subclass should override", v1, 2u);
}

@end