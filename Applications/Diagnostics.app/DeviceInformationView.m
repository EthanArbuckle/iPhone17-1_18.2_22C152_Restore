@interface DeviceInformationView
- (UIActivityIndicatorView)activityIndicator;
- (UIButton)addButton;
- (UIButton)ellipsisButton;
- (UILabel)descriptionLabel;
- (UILabel)deviceIdentifierLabel;
- (UILabel)infoLabel;
- (UILabel)marketingNameLabel;
- (_TtC11Diagnostics21DeviceInformationView)initWithCoder:(id)a3;
- (_TtC11Diagnostics21DeviceInformationView)initWithFrame:(CGRect)a3;
- (int64_t)infoLabelType;
- (void)addButtonPressedWithSender:(id)a3;
- (void)ellipsisButtonPressedWithSender:(id)a3;
- (void)infoLabelTapped;
- (void)setInfoLabelType:(int64_t)a3;
- (void)tintColorDidChange;
@end

@implementation DeviceInformationView

- (UILabel)marketingNameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_marketingNameLabel));
}

- (UILabel)descriptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_descriptionLabel));
}

- (UILabel)infoLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabel));
}

- (UILabel)deviceIdentifierLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceIdentifierLabel));
}

- (UIButton)ellipsisButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_ellipsisButton));
}

- (UIButton)addButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_addButton));
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_activityIndicator));
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_10003C9C4();
}

- (int64_t)infoLabelType
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabelType);
}

- (void)setInfoLabelType:(int64_t)a3
{
  v4 = self;
  sub_10003DAB4(a3);
}

- (_TtC11Diagnostics21DeviceInformationView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics21DeviceInformationView *)sub_10003DF20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics21DeviceInformationView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics21DeviceInformationView *)sub_10003E734(a3);
}

- (void)addButtonPressedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000421F0((uint64_t)v4);
}

- (void)ellipsisButtonPressedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100042260((uint64_t)v4);
}

- (void)infoLabelTapped
{
  v2 = self;
  sub_1000423A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_marketingNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceIdentifierLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_ellipsisButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_activityIndicator));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceImageView));
  sub_10004299C((uint64_t)self + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_delegate);
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_containerLayoutUpdateHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_marketingNameLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_addButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_ellipsisButtonImageWidthConstraint));

  swift_bridgeObjectRelease();
}

@end