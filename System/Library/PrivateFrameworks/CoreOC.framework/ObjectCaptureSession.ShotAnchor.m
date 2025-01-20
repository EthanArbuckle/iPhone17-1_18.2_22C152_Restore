@interface ObjectCaptureSession.ShotAnchor
- (_TtCC6CoreOC20ObjectCaptureSessionP33_1CBB41402969BD195192C8954988428210ShotAnchor)initWithAnchor:(id)a3;
- (_TtCC6CoreOC20ObjectCaptureSessionP33_1CBB41402969BD195192C8954988428210ShotAnchor)initWithCoder:(id)a3;
- (id)initWithIdentifier:(uint64_t)a3 transform:(__n128)a4;
- (id)initWithIdentifier:(uint64_t)a3 transform:(uint64_t)a4 name:(__n128)a5;
- (id)initWithIdentifier:(uint64_t)a3 transform:(uint64_t)a4 name:(char)a5 hiddenFromPublicDelegate:(__n128)a6;
- (id)initWithName:(uint64_t)a3 transform:(double)a4;
- (id)initWithTransform:(double)a3;
@end

@implementation ObjectCaptureSession.ShotAnchor

- (id)initWithTransform:(double)a3
{
  return sub_24B61D7F0(a1, a3, a4, a5, a6, a2, type metadata accessor for ObjectCaptureSession.ShotAnchor);
}

- (id)initWithName:(uint64_t)a3 transform:(double)a4
{
  return sub_24B61D85C(a1, a4, a5, a6, a7, a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for ObjectCaptureSession.ShotAnchor);
}

- (_TtCC6CoreOC20ObjectCaptureSessionP33_1CBB41402969BD195192C8954988428210ShotAnchor)initWithAnchor:(id)a3
{
  return (_TtCC6CoreOC20ObjectCaptureSessionP33_1CBB41402969BD195192C8954988428210ShotAnchor *)sub_24B61D900(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ObjectCaptureSession.ShotAnchor);
}

- (_TtCC6CoreOC20ObjectCaptureSessionP33_1CBB41402969BD195192C8954988428210ShotAnchor)initWithCoder:(id)a3
{
  return (_TtCC6CoreOC20ObjectCaptureSessionP33_1CBB41402969BD195192C8954988428210ShotAnchor *)sub_24B61D964(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ObjectCaptureSession.ShotAnchor);
}

- (id)initWithIdentifier:(uint64_t)a3 transform:(__n128)a4
{
  return sub_24B61D9C8(a1, a4, a5, a6, a7, a2, a3, type metadata accessor for ObjectCaptureSession.ShotAnchor);
}

- (id)initWithIdentifier:(uint64_t)a3 transform:(uint64_t)a4 name:(__n128)a5
{
  return sub_24B61DB04(a1, a5, a6, a7, a8, a2, a3, a4, (uint64_t (*)(uint64_t))type metadata accessor for ObjectCaptureSession.ShotAnchor);
}

- (id)initWithIdentifier:(uint64_t)a3 transform:(uint64_t)a4 name:(char)a5 hiddenFromPublicDelegate:(__n128)a6
{
  return sub_24B61DE34(a6, a7, a8, a9, a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))type metadata accessor for ObjectCaptureSession.ShotAnchor);
}

@end