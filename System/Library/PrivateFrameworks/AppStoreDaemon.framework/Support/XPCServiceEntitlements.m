@interface XPCServiceEntitlements
- (void)dealloc;
@end

@implementation XPCServiceEntitlements

- (void)dealloc
{
  CFRelease(self->_task);
  v3.receiver = self;
  v3.super_class = (Class)XPCServiceEntitlements;
  [(XPCServiceEntitlements *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end