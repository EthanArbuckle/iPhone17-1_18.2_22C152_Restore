@interface HSTSetReportEvent
+ (const)hsClassName;
- (HSTSetReportEvent)initWithBuffer:(void *)a3 length:(unint64_t)a4;
- (NSData)report;
- (void)setReport:(id)a3;
@end

@implementation HSTSetReportEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)83,(char)101,(char)116,(char)82,(char)101,(char)112,(char)111,(char)114,(char)116,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (HSTSetReportEvent)initWithBuffer:(void *)a3 length:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)HSTSetReportEvent;
  v6 = [(HSTEvent *)&v11 init];
  if (v6)
  {
    uint64_t v7 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
    report = v6->_report;
    v6->_report = (NSData *)v7;

    v9 = v6;
  }

  return v6;
}

- (NSData)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end