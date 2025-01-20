@interface MKReverseGeocoderInternal
@end

@implementation MKReverseGeocoderInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->ticket, 0);
  objc_storeStrong((id *)&self->mapItem, 0);

  objc_storeStrong((id *)&self->delegate, 0);
}

@end