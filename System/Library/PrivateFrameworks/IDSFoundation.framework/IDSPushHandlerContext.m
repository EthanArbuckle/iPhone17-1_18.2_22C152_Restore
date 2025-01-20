@interface IDSPushHandlerContext
- (IDSPushHandlerContext)initWithQueue:(id)a3 wakingTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 commands:(id)a7;
- (NSSet)commands;
- (NSSet)nonWakingTopics;
- (NSSet)opportunisticTopics;
- (NSSet)wakingTopics;
- (OS_dispatch_queue)queue;
- (void)setCommands:(id)a3;
- (void)setNonWakingTopics:(id)a3;
- (void)setOpportunisticTopics:(id)a3;
- (void)setWakingTopics:(id)a3;
@end

@implementation IDSPushHandlerContext

- (IDSPushHandlerContext)initWithQueue:(id)a3 wakingTopics:(id)a4 opportunisticTopics:(id)a5 nonWakingTopics:(id)a6 commands:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v41.receiver = self;
  v41.super_class = (Class)IDSPushHandlerContext;
  v18 = [(IDSPushHandlerContext *)&v41 init];
  v22 = v18;
  if (v18)
  {
    if (v13) {
      objc_storeStrong((id *)&v18->_queue, a3);
    }
    uint64_t v23 = objc_msgSend_copy(v14, v19, v20, v21);
    wakingTopics = v22->_wakingTopics;
    v22->_wakingTopics = (NSSet *)v23;

    uint64_t v28 = objc_msgSend_copy(v15, v25, v26, v27);
    opportunisticTopics = v22->_opportunisticTopics;
    v22->_opportunisticTopics = (NSSet *)v28;

    uint64_t v33 = objc_msgSend_copy(v16, v30, v31, v32);
    nonWakingTopics = v22->_nonWakingTopics;
    v22->_nonWakingTopics = (NSSet *)v33;

    uint64_t v38 = objc_msgSend_copy(v17, v35, v36, v37);
    commands = v22->_commands;
    v22->_commands = (NSSet *)v38;
  }
  return v22;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSSet)wakingTopics
{
  return self->_wakingTopics;
}

- (void)setWakingTopics:(id)a3
{
}

- (NSSet)opportunisticTopics
{
  return self->_opportunisticTopics;
}

- (void)setOpportunisticTopics:(id)a3
{
}

- (NSSet)nonWakingTopics
{
  return self->_nonWakingTopics;
}

- (void)setNonWakingTopics:(id)a3
{
}

- (NSSet)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonWakingTopics, 0);
  objc_storeStrong((id *)&self->_opportunisticTopics, 0);
  objc_storeStrong((id *)&self->_wakingTopics, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end