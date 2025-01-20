@interface NEIKEv2ChildSAConfiguration
- (BOOL)opportunisticPFS;
- (BOOL)preferInitiatorProposalOrder;
- (BOOL)sequencePerTrafficClass;
- (NEIKEv2ChildSAConfiguration)init;
- (NSArray)localTrafficSelectors;
- (NSArray)proposals;
- (NSArray)remoteTrafficSelectors;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)mode;
- (unsigned)replayWindowSize;
- (void)setLocalTrafficSelectors:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setOpportunisticPFS:(BOOL)a3;
- (void)setPreferInitiatorProposalOrder:(BOOL)a3;
- (void)setProposals:(id)a3;
- (void)setRemoteTrafficSelectors:(id)a3;
- (void)setReplayWindowSize:(unsigned int)a3;
- (void)setSequencePerTrafficClass:(BOOL)a3;
@end

@implementation NEIKEv2ChildSAConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_localTrafficSelectors, 0);

  objc_storeStrong((id *)&self->_proposals, 0);
}

- (void)setRemoteTrafficSelectors:(id)a3
{
}

- (NSArray)remoteTrafficSelectors
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLocalTrafficSelectors:(id)a3
{
}

- (NSArray)localTrafficSelectors
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOpportunisticPFS:(BOOL)a3
{
  self->_opportunisticPFS = a3;
}

- (BOOL)opportunisticPFS
{
  return self->_opportunisticPFS;
}

- (void)setPreferInitiatorProposalOrder:(BOOL)a3
{
  self->_preferInitiatorProposalOrder = a3;
}

- (BOOL)preferInitiatorProposalOrder
{
  return self->_preferInitiatorProposalOrder;
}

- (void)setSequencePerTrafficClass:(BOOL)a3
{
  self->_sequencePerTrafficClass = a3;
}

- (BOOL)sequencePerTrafficClass
{
  return self->_sequencePerTrafficClass;
}

- (void)setReplayWindowSize:(unsigned int)a3
{
  self->_replayWindowSize = a3;
}

- (unsigned)replayWindowSize
{
  return self->_replayWindowSize;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setProposals:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)[a3 copy];
  proposals = self->_proposals;
  self->_proposals = v4;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_proposals;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        ++v9;
        if (v12) {
          *(unsigned char *)(v12 + 8) = v9;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (NSArray)proposals
{
  return self->_proposals;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMode:", -[NEIKEv2ChildSAConfiguration mode](self, "mode"));
  objc_msgSend(v4, "setReplayWindowSize:", -[NEIKEv2ChildSAConfiguration replayWindowSize](self, "replayWindowSize"));
  objc_msgSend(v4, "setSequencePerTrafficClass:", -[NEIKEv2ChildSAConfiguration sequencePerTrafficClass](self, "sequencePerTrafficClass"));
  objc_msgSend(v4, "setPreferInitiatorProposalOrder:", -[NEIKEv2ChildSAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"));
  v5 = [(NEIKEv2ChildSAConfiguration *)self proposals];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v7 = [(NEIKEv2ChildSAConfiguration *)self proposals];
    uint64_t v8 = (void *)[v6 initWithArray:v7 copyItems:1];
    [v4 setProposals:v8];
  }
  char v9 = [(NEIKEv2ChildSAConfiguration *)self localTrafficSelectors];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C978]);
    v11 = [(NEIKEv2ChildSAConfiguration *)self localTrafficSelectors];
    uint64_t v12 = (void *)[v10 initWithArray:v11 copyItems:1];
    [v4 setLocalTrafficSelectors:v12];
  }
  long long v13 = [(NEIKEv2ChildSAConfiguration *)self remoteTrafficSelectors];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1C978]);
    long long v15 = [(NEIKEv2ChildSAConfiguration *)self remoteTrafficSelectors];
    long long v16 = (void *)[v14 initWithArray:v15 copyItems:1];
    [v4 setRemoteTrafficSelectors:v16];
  }
  return v4;
}

- (id)description
{
  return [(NEIKEv2ChildSAConfiguration *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  ChildSAModeString = NEIKEv2CreateChildSAModeString([(NEIKEv2ChildSAConfiguration *)self mode]);
  [v7 appendPrettyObject:ChildSAModeString withName:@"Mode" andIndent:v5 options:a4];

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration replayWindowSize](self, "replayWindowSize"), @"Replay Window Size", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration sequencePerTrafficClass](self, "sequencePerTrafficClass"), @"Sequence Per Traffic Class", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration preferInitiatorProposalOrder](self, "preferInitiatorProposalOrder"), @"Prefer Initiator Proposal Order", v5, a4);
  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NEIKEv2ChildSAConfiguration opportunisticPFS](self, "opportunisticPFS"), @"Opportunistic PFS", v5, a4);
  char v9 = [(NEIKEv2ChildSAConfiguration *)self proposals];
  [v7 appendPrettyObject:v9 withName:@"Proposals" andIndent:v5 options:a4];

  id v10 = [(NEIKEv2ChildSAConfiguration *)self localTrafficSelectors];
  [v7 appendPrettyObject:v10 withName:@"Local Traffic Selectors" andIndent:v5 options:a4];

  v11 = [(NEIKEv2ChildSAConfiguration *)self remoteTrafficSelectors];
  [v7 appendPrettyObject:v11 withName:@"Remote Traffic Selectors" andIndent:v5 options:a4];

  return v7;
}

- (NEIKEv2ChildSAConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2ChildSAConfiguration;
  v2 = [(NEIKEv2ChildSAConfiguration *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(NEIKEv2ChildSAConfiguration *)v2 setReplayWindowSize:4];
    v4 = v3;
  }
  else
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }
  }
  return v3;
}

@end