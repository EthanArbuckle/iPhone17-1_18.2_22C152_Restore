@interface SWCachedHighlightEvent
+ (id)cachedEvent:(id)a3 forHighlight:(id)a4;
- (NSUUID)uuid;
- (SWCachedHighlightEvent)initWithEvent:(id)a3 forHighlight:(id)a4;
- (SWHighlight)highlight;
- (SWHighlightEvent)event;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SWCachedHighlightEvent

+ (id)cachedEvent:(id)a3 forHighlight:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithEvent:v7 forHighlight:v6];

  return v8;
}

- (SWCachedHighlightEvent)initWithEvent:(id)a3 forHighlight:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SWCachedHighlightEvent;
  v9 = [(SWCachedHighlightEvent *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v10->_highlight, a4);
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(SWCachedHighlightEvent *)self event];
  id v6 = [(SWCachedHighlightEvent *)self highlight];
  id v7 = (void *)[v4 initWithEvent:v5 forHighlight:v6];

  return v7;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (SWHighlightEvent)event
{
  return self->_event;
}

- (SWHighlight)highlight
{
  return self->_highlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_event, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end