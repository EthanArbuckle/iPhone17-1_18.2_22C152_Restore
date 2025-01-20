@interface ASDTIOA2JackControl
- (ASDTIOA2JackControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 dictionary:(id)a8;
@end

@implementation ASDTIOA2JackControl

- (ASDTIOA2JackControl)initWithIOA2Device:(id)a3 userClientID:(unsigned int)a4 isSettable:(BOOL)a5 element:(unsigned int)a6 scope:(unsigned int)a7 dictionary:(id)a8
{
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2JackControl;
  return [(ASDTIOA2BooleanControl *)&v9 initWithIOA2Device:a3 userClientID:*(void *)&a4 isSettable:a5 element:*(void *)&a6 scope:*(void *)&a7 objectClassID:1784767339 dictionary:a8];
}

@end