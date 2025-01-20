@interface _GEOTransitTicketingSegment
- (NSString)segmentName;
- (NSString)ticketingUrl;
- (_GEOTransitTicketingSegment)initWithSegment:(id)a3;
@end

@implementation _GEOTransitTicketingSegment

- (_GEOTransitTicketingSegment)initWithSegment:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 ticketingUrl];
  if (v6
    && (v7 = (void *)v6,
        [v5 segmentName],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v13.receiver = self;
    v13.super_class = (Class)_GEOTransitTicketingSegment;
    v9 = [(_GEOTransitTicketingSegment *)&v13 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_segment, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)ticketingUrl
{
  return [(GEOTransitTicketingSegment *)self->_segment ticketingUrl];
}

- (NSString)segmentName
{
  return [(GEOTransitTicketingSegment *)self->_segment segmentName];
}

- (void).cxx_destruct
{
}

@end