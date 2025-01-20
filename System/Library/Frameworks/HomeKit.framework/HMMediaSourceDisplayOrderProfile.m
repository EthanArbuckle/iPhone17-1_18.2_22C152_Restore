@interface HMMediaSourceDisplayOrderProfile
- (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile)initWithAccessoryProfile:(id)a3;
- (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile)initWithTelevisionProfile:(id)a3;
@end

@implementation HMMediaSourceDisplayOrderProfile

- (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile)initWithTelevisionProfile:(id)a3
{
  id v3 = a3;
  v4 = sub_19D1E5BD8(v3);

  return (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile *)v4;
}

- (_TtC7HomeKit32HMMediaSourceDisplayOrderProfile)initWithAccessoryProfile:(id)a3
{
  id v3 = a3;
  sub_19D1E5D1C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_televisionProfile));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_displayOrderProfileDelegateAdaptor));
  id v3 = (char *)self + OBJC_IVAR____TtC7HomeKit32HMMediaSourceDisplayOrderProfile_delegate;

  sub_19D1E5DB4((uint64_t)v3);
}

@end