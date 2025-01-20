@interface CFStringRef?:
- (void)Int;
@end

@implementation CFStringRef?:

- (void)Int
{
  if (!lazy cache variable for type metadata for (CFStringRef, [CFStringRef? : Int]))
  {
    type metadata accessor for CFStringRef(255);
    type metadata accessor for [CFStringRef? : Int](255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&lazy cache variable for type metadata for (CFStringRef, [CFStringRef? : Int]));
    }
  }
}

@end